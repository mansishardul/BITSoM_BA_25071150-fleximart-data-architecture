/*****************************************************
 Operation 1: Load Data (1 mark)
 products_catalog.json is already imported into 'products' collection created in mongodb compass from UI option.
  This JS file will run through mongosh (mongo shell) on windows cmd.
*****************************************************/

use("fleximart");

/*****************************************************
 Operation 2: Basic Query (2 marks)
 Find all Electronics products with price < 50000
 Return only: name, price, stock
*****************************************************/

printjson(
  db.products.find(
    { category: "Electronics", price: { $lt: 50000 } },
    { _id: 0, name: 1, price: 1, stock: 1 }
  ).toArray()
);

/*****************************************************
 Operation 3: Review Analysis (2 marks)
 Find products with average rating >= 4.0
*****************************************************/

printjson(
  db.products.aggregate([
    { $unwind: "$reviews" },
    {
      $group: {
        _id: "$name",
        avg_rating: { $avg: "$reviews.rating" }
      }
    },
    { $match: { avg_rating: { $gte: 4.0 } } }
  ]).toArray()
);

/*****************************************************
 Operation 4: Update Operation (2 marks)
 Add a new review to product ELEC001
*****************************************************/

db.products.updateOne(
  { product_id: "ELEC001" },
  {
    $push: {
      reviews: {
        user: "U999",
        rating: 4,
        comment: "Good value",
        date: new Date()
      }
    }
  }
);

print("Review added successfully for ELEC001");

/*****************************************************
 Operation 5: Complex Aggregation (3 marks)
 Average price by category
*****************************************************/

printjson(
  db.products.aggregate([
    {
      $group: {
        _id: "$category",
        avg_price: { $avg: "$price" },
        product_count: { $sum: 1 }
      }
    },
    {
      $project: {
        _id: 0,
        category: "$_id",
        avg_price: { $round: ["$avg_price", 2] },
        product_count: 1
      }
    },
    { $sort: { avg_price: -1 } }
  ]).toArray()
);
