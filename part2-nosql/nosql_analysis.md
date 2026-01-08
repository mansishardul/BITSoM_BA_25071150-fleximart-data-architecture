## Section A: Limitations of RDBMS

Relational databases like MySQL work best when data structure is fixed. But in FlexiMart, products are very different. For example, electronics like mobiles or laptops need fields such as RAM, processor, and storage. Fashion items like clothes or shoes need size, color, and material. If we use MySQL, we either need many empty (NULL) columns or separate tables, which makes the design complicated.

Also, when a new product type is added, we need to change the table structure using `ALTER TABLE`. This is risky and time‑consuming in production systems.

Customer reviews are another problem. Reviews have multiple entries for one product, so they must be stored in separate tables and joined later. This increases query complexity and slows down performance.

---

## Section B: NoSQL Benefits

MongoDB solves these issues by using a flexible document structure. Each product can have its own fields. For example, a mobile document can store RAM and processor, while a clothing document can store size and fabric, all in the same collection.

MongoDB also allows embedded documents. Customer reviews can be stored directly inside the product document. This makes fetching product details and reviews very fast because no joins are required.

Another benefit is scalability. MongoDB supports sharding, which helps handle large data and high traffic easily. This makes MongoDB a good choice for FlexiMart.

---

## Section C: Trade-offs

MongoDB does not support strong relational constraints like foreign keys. Because of this, the application must handle data consistency carefully.

Also, complex transactions across multiple collections are easier in MySQL. Although MongoDB supports transactions, they can be harder to manage compared to SQL databases.

