CREATE TABLE [users] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [email] nvarchar(255) UNIQUE,
  [password] nvarchar(255),
  [created_at] timestamp
)
GO

CREATE TABLE [categories] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [description] text
)
GO

CREATE TABLE [products] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [category_id] int,
  [price] decimal,
  [description] text,
  [stock] int,
  [created_at] timestamp
)
GO

CREATE TABLE [reviews] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [user_id] int,
  [product_id] int,
  [rating] int,
  [comment] text,
  [created_at] timestamp
)
GO

CREATE TABLE [related_products] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [product_id] int,
  [related_product_id] int
)
GO

CREATE TABLE [carts] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [user_id] int,
  [created_at] timestamp
)
GO

CREATE TABLE [cart_items] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [cart_id] int,
  [product_id] int,
  [quantity] int,
  [added_at] timestamp
)
GO

ALTER TABLE [products] ADD FOREIGN KEY ([category_id]) REFERENCES [categories] ([id])
GO

ALTER TABLE [reviews] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [reviews] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [carts] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [cart_items] ADD FOREIGN KEY ([cart_id]) REFERENCES [carts] ([id])
GO

ALTER TABLE [cart_items] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [related_products] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [related_products] ADD FOREIGN KEY ([related_product_id]) REFERENCES [products] ([id])
GO
