# Clear existing data (optional, depending on your use case)
Brand.destroy_all
Category.destroy_all
Product.destroy_all

# Create brands
brand1 = Brand.create(name: 'Iphone', description: 'Description for Iphone')
brand2 = Brand.create(name: 'Samsung', description: 'Description for samsung')
# Add more brands as needed

# Create categories
category1 = Category.create(name: 'phone', description: 'Description for phone')
category2 = Category.create(name: 'laptop', description: 'Description for laptop')
# Add more categories as needed

# Create products
product1 = Product.create(
  name: 'Product 1',
  price: 19.99,
  description: 'Description for Product 1',
  img: 'https://picsum.photos/200/300', # Replace with the actual image path or URL
  brand: brand1,
  category: category1
)

product2 = Product.create(
  name: 'Product 2',
  price: 29.99,
  description: 'Description for Product 2',
  img: 'https://picsum.photos/200/300', # Replace with the actual image path or URL
  brand: brand2,
  category: category2
)