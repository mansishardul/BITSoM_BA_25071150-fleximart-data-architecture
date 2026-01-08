import pandas as pd
import mysql.connector
import re

# -------------------- DB CONFIG --------------------
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "Shrady_789s@",
    "database": "fleximart"
}

# -------------------- HELPERS --------------------
def standardize_phone(phone):
    if pd.isna(phone):
        return None
    digits = re.sub(r"\D", "", str(phone))
    if len(digits) == 10:
        return "+91-" + digits
    return None

def parse_date(val):
    return pd.to_datetime(val, errors="coerce").date()

# -------------------- CLEANING --------------------
def clean_customers(df, report):
    initial = len(df)

    missing_email_count = df["email"].isna().sum()
    missing_phone_count = df["phone"].isna().sum()
    missing_date_count = df["registration_date"].isna().sum()

    df = df.drop_duplicates().copy()

    missing_email_mask = df["email"].isna()
    df.loc[missing_email_mask, "email"] = (
        "unknown_" + df.loc[missing_email_mask].index.astype(str) + "@fleximart.com"
    )

    df["phone"] = df["phone"].apply(standardize_phone)
    df["registration_date"] = df["registration_date"].apply(parse_date)

    report.append(
        f"Customers: Processed={initial}, "
        f"Duplicates Removed={initial - len(df)}, "
        f"Missing Values Handled={missing_email_count + missing_phone_count + missing_date_count}, "
        f"Loaded={len(df)}"
    )
    return df



def clean_products(df, report):
    initial = len(df)

    missing_price_count = df["price"].isna().sum()
    missing_stock_count = df["stock_quantity"].isna().sum()

    df = df.drop_duplicates()
    df["category"] = df["category"].str.strip().str.capitalize()
    df["price"] = df["price"].fillna(df["price"].median())
    df["stock_quantity"] = df["stock_quantity"].fillna(0).astype(int)

    report.append(
        f"Products: Processed={initial}, "
        f"Duplicates Removed={initial - len(df)}, "
        f"Missing Values Handled={missing_price_count + missing_stock_count}, "
        f"Loaded={len(df)}"
    )
    return df



def clean_sales(df, report):
    initial = len(df)

    missing_qty_count = df["quantity"].isna().sum()
    missing_date_count = df["transaction_date"].isna().sum()
    missing_fk_rows = df[
        df["customer_id"].isna() | df["product_id"].isna()
    ].shape[0]

    df = df.drop_duplicates()
    df["transaction_date"] = df["transaction_date"].apply(parse_date)
    df["quantity"] = pd.to_numeric(df["quantity"], errors="coerce").fillna(1)
    df["unit_price"] = pd.to_numeric(df["unit_price"], errors="coerce")

    df = df.dropna(subset=["customer_id", "product_id"])

    report.append(
        f"Sales: Processed={initial}, "
        f"Duplicates Removed={initial - len(df)}, "
        f"Missing Values Handled={missing_qty_count + missing_date_count + missing_fk_rows}, "
        f"Loaded={len(df)}"
    )
    return df


# -------------------- LOAD --------------------
def load_to_db(customers, products, sales):
    conn = mysql.connector.connect(**DB_CONFIG)
    cur = conn.cursor()

    # ---------------- CUSTOMERS ----------------
    for _, r in customers.iterrows():
        cur.execute("""
            INSERT IGNORE INTO customers
            (customer_id, first_name, last_name, email, phone, city, registration_date)
            VALUES (%s,%s,%s,%s,%s,%s,%s)
        """, tuple(r))

    # ---------------- PRODUCTS ----------------
    for _, r in products.iterrows():
        cur.execute("""
            INSERT IGNORE INTO products
            (product_id, product_name, category, price, stock_quantity)
            VALUES (%s,%s,%s,%s,%s)
        """, tuple(r))

    # ---------------- SALES ----------------
    for _, r in sales.iterrows():
        cur.execute("""
            INSERT IGNORE INTO sales
            (transaction_id, customer_id, product_id, quantity, unit_price, transaction_date, status)
            VALUES (%s,%s,%s,%s,%s,%s,%s)
        """, tuple(r))

    # ================= ORDERS =================
    orders_df = (
        sales.groupby(["transaction_id", "customer_id", "transaction_date"])
        .apply(lambda x: (x["quantity"] * x["unit_price"]).sum())
        .reset_index(name="total_amount")
    )

    for _, r in orders_df.iterrows():
        cur.execute("""
            INSERT IGNORE INTO orders
            (order_id, customer_id, order_date, total_amount, status)
            VALUES (%s,%s,%s,%s,%s)
        """, (
            r["transaction_id"],
            r["customer_id"],
            r["transaction_date"],
            round(r["total_amount"], 2),
            "Completed"
        ))

    # ================= ORDER ITEMS =================
    for _, r in sales.iterrows():
        subtotal = r["quantity"] * r["unit_price"]

        cur.execute("""
            INSERT IGNORE INTO order_items
            (order_item_id, order_id, product_id, quantity, unit_price, subtotal)
            VALUES (%s,%s,%s,%s,%s,%s)
        """, (
            f"{r['transaction_id']}_{r['product_id']}",
            r["transaction_id"],
            r["product_id"],
            int(r["quantity"]),
            float(r["unit_price"]),
            round(subtotal, 2)
        ))

    conn.commit()
    cur.close()
    conn.close()


# -------------------- MAIN --------------------
def main():
    print("Starting ETL pipeline...")

    report = []

    customers = pd.read_csv("data/customer.csv")
    products = pd.read_csv("data/products_raw.csv")
    sales = pd.read_csv("data/sales_raw.csv")

    customers = clean_customers(customers, report)
    products = clean_products(products, report)
    sales = clean_sales(sales, report)

    load_to_db(customers, products, sales)

    with open("data_quality_report.txt", "w") as f:
        f.write("\n".join(report))

    print("ETL completed successfully")
    print("Data quality report generated")

if __name__ == "__main__":
    main()
