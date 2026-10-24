-- BombayBoozeDB seed data: categories + products
-- Run AFTER `alembic upgrade head` (needs the image_url column).
-- Safe to re-run: INSERT IGNORE skips rows whose name/SKU already exist.
-- Stock quantity is random (5..200) each time rows are first inserted.

USE BombayBoozeDB;

INSERT IGNORE INTO product_category (name, description) VALUES
  ('Whisky', 'Scotch, Irish, bourbon, Canadian and Indian whisky'),
  ('Vodka', 'Grain, potato and flavoured vodkas'),
  ('Rum', 'White, gold, dark, spiced and aged rums'),
  ('Gin', 'London dry, craft and botanical gins'),
  ('Tequila', 'Blanco, reposado and anejo tequilas'),
  ('Brandy & Cognac', 'French cognac and international brandy'),
  ('Liqueur', 'Cream, herbal, fruit and aperitif liqueurs'),
  ('Wine', 'Red, white, rose and sparkling wines'),
  ('Beer', 'Lagers, ales, stouts and craft beer');

-- Whisky (20 products)
INSERT IGNORE INTO product_inventory
  (category_id, sku, name, brand, abv, volume_ml, price, quantity_in_stock, reorder_level, image_url) VALUES
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-JAM-001', 'Jameson Irish Whiskey', 'Jameson', 40.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-jam-001.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-JAC-002', 'Jack Daniel''s Old No. 7 Tennessee Whiskey', 'Jack Daniel''s', 40.00, 750, 27.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-jac-002.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-JOH-003', 'Johnnie Walker Black Label', 'Johnnie Walker', 40.00, 750, 39.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-joh-003.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-JOH-004', 'Johnnie Walker Red Label', 'Johnnie Walker', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-joh-004.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-JIM-005', 'Jim Beam Original Bourbon', 'Jim Beam', 40.00, 750, 19.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-jim-005.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-MAK-006', 'Maker''s Mark Bourbon', 'Maker''s Mark', 45.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-mak-006.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-CRO-007', 'Crown Royal Canadian Whisky', 'Crown Royal', 40.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-cro-007.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-GLE-008', 'Glenfiddich 12 Year Old', 'Glenfiddich', 40.00, 750, 49.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-gle-008.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-THE-009', 'The Glenlivet 12 Year Old', 'The Glenlivet', 40.00, 750, 44.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-the-009.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-THE-010', 'The Macallan 12 Double Cask', 'The Macallan', 40.00, 750, 74.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-the-010.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-LAG-011', 'Lagavulin 16 Year Old', 'Lagavulin', 43.00, 750, 109.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-lag-011.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-LAP-012', 'Laphroaig 10 Year Old', 'Laphroaig', 40.00, 750, 54.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-lap-012.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-WOO-013', 'Woodford Reserve Bourbon', 'Woodford Reserve', 45.20, 750, 34.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-woo-013.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-BUL-014', 'Bulleit Bourbon', 'Bulleit', 45.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-bul-014.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-CHI-015', 'Chivas Regal 12 Year Old', 'Chivas Regal', 40.00, 750, 31.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-chi-015.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-AMR-016', 'Amrut Fusion Single Malt', 'Amrut', 50.00, 750, 64.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-amr-016.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-PAU-017', 'Paul John Brilliance Single Malt', 'Paul John', 46.00, 750, 59.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-pau-017.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-ROY-018', 'Royal Stag Barrel Select', 'Royal Stag', 42.80, 750, 14.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-roy-018.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-BLE-019', 'Blenders Pride Reserve Collection', 'Blenders Pride', 42.80, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-ble-019.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Whisky'), 'WHK-MON-020', 'Monkey Shoulder Blended Malt', 'Monkey Shoulder', 40.00, 750, 32.99, FLOOR(5 + RAND() * 196), 10, '/static/products/whk-mon-020.jpg');

-- Vodka (20 products)
INSERT IGNORE INTO product_inventory
  (category_id, sku, name, brand, abv, volume_ml, price, quantity_in_stock, reorder_level, image_url) VALUES
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-ABS-001', 'Absolut Vodka', 'Absolut', 40.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-abs-001.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-SMI-002', 'Smirnoff No. 21 Vodka', 'Smirnoff', 40.00, 750, 17.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-smi-002.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-GRE-003', 'Grey Goose Vodka', 'Grey Goose', 40.00, 750, 32.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-gre-003.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-TIT-004', 'Tito''s Handmade Vodka', 'Tito''s', 40.00, 750, 21.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-tit-004.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-KET-005', 'Ketel One Vodka', 'Ketel One', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-ket-005.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-BEL-006', 'Belvedere Vodka', 'Belvedere', 40.00, 750, 34.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-bel-006.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-CIR-007', 'Ciroc Vodka', 'Ciroc', 40.00, 750, 28.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-cir-007.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-STO-008', 'Stolichnaya Vodka', 'Stolichnaya', 40.00, 750, 19.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-sto-008.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-SKY-009', 'Skyy Vodka', 'Skyy', 40.00, 750, 15.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-sky-009.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-NEW-010', 'New Amsterdam Vodka', 'New Amsterdam', 40.00, 750, 12.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-new-010.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-SVE-011', 'Svedka Vodka', 'Svedka', 40.00, 750, 13.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-sve-011.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-FIN-012', 'Finlandia Vodka', 'Finlandia', 40.00, 750, 18.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-fin-012.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-REY-013', 'Reyka Icelandic Vodka', 'Reyka', 40.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-rey-013.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-CHO-014', 'Chopin Potato Vodka', 'Chopin', 40.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-cho-014.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-HAN-015', 'Hangar 1 Straight Vodka', 'Hangar 1', 40.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-han-015.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-CRY-016', 'Crystal Head Vodka', 'Crystal Head', 40.00, 750, 49.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-cry-016.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-ABS-017', 'Absolut Citron', 'Absolut', 40.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-abs-017.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-SMI-018', 'Smirnoff Vanilla', 'Smirnoff', 35.00, 750, 17.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-smi-018.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-ERI-019', 'Eristoff Original Vodka', 'Eristoff', 37.50, 750, 14.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-eri-019.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Vodka'), 'VOD-MAG-020', 'Magic Moments Vodka', 'Magic Moments', 42.80, 750, 12.99, FLOOR(5 + RAND() * 196), 10, '/static/products/vod-mag-020.jpg');

-- Rum (20 products)
INSERT IGNORE INTO product_inventory
  (category_id, sku, name, brand, abv, volume_ml, price, quantity_in_stock, reorder_level, image_url) VALUES
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-BAC-001', 'Bacardi Superior White Rum', 'Bacardi', 40.00, 750, 17.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-bac-001.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-CAP-002', 'Captain Morgan Original Spiced Rum', 'Captain Morgan', 35.00, 750, 19.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-cap-002.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-MAL-003', 'Malibu Coconut Rum', 'Malibu', 21.00, 750, 16.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-mal-003.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-HAV-004', 'Havana Club 7 Anos', 'Havana Club', 40.00, 750, 27.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-hav-004.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-MOU-005', 'Mount Gay Eclipse', 'Mount Gay', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-mou-005.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-APP-006', 'Appleton Estate Signature', 'Appleton Estate', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-app-006.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-KRA-007', 'Kraken Black Spiced Rum', 'Kraken', 47.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-kra-007.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-DIP-008', 'Diplomatico Reserva Exclusiva', 'Diplomatico', 40.00, 750, 39.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-dip-008.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-DON-009', 'Don Papa 7 Year Rum', 'Don Papa', 40.00, 750, 34.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-don-009.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-PLA-010', 'Plantation 5 Year Barbados Rum', 'Plantation', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-pla-010.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-SAI-011', 'Sailor Jerry Spiced Rum', 'Sailor Jerry', 46.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-sai-011.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-BAC-012', 'Bacardi Gold Rum', 'Bacardi', 40.00, 750, 17.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-bac-012.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-BAC-013', 'Bacardi Reserva Ocho 8 Anos', 'Bacardi', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-bac-013.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-FLO-014', 'Flor de Cana 12 Year', 'Flor de Cana', 40.00, 750, 32.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-flo-014.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-RON-015', 'Ron Zacapa 23 Solera', 'Ron Zacapa', 40.00, 750, 49.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-ron-015.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-GOS-016', 'Gosling''s Black Seal Rum', 'Gosling''s', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-gos-016.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-OLD-017', 'Old Monk 7 Year Old Rum', 'Old Monk', 42.80, 750, 14.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-old-017.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-MCD-018', 'McDowell''s No.1 Celebration Rum', 'McDowell''s', 42.80, 750, 9.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-mcd-018.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-LAM-019', 'Lamb''s Navy Rum', 'Lamb''s', 40.00, 750, 17.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-lam-019.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Rum'), 'RUM-TAN-020', 'Tanduay Silver Rum', 'Tanduay', 40.00, 750, 11.99, FLOOR(5 + RAND() * 196), 10, '/static/products/rum-tan-020.jpg');

-- Gin (20 products)
INSERT IGNORE INTO product_inventory
  (category_id, sku, name, brand, abv, volume_ml, price, quantity_in_stock, reorder_level, image_url) VALUES
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-BOM-001', 'Bombay Sapphire London Dry Gin', 'Bombay Sapphire', 47.00, 750, 26.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-bom-001.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-TAN-002', 'Tanqueray London Dry Gin', 'Tanqueray', 47.30, 750, 26.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-tan-002.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-BEE-003', 'Beefeater London Dry Gin', 'Beefeater', 40.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-bee-003.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-HEN-004', 'Hendrick''s Gin', 'Hendrick''s', 41.40, 750, 36.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-hen-004.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-GOR-005', 'Gordon''s London Dry Gin', 'Gordon''s', 37.50, 750, 15.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-gor-005.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-SIP-006', 'Sipsmith London Dry Gin', 'Sipsmith', 41.60, 750, 34.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-sip-006.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-MON-007', 'Monkey 47 Schwarzwald Dry Gin', 'Monkey 47', 47.50, 500, 54.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-mon-007.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-ROK-008', 'Roku Japanese Craft Gin', 'Roku', 43.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-rok-008.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-THE-009', 'The Botanist Islay Dry Gin', 'The Botanist', 46.00, 750, 36.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-the-009.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-AVI-010', 'Aviation American Gin', 'Aviation', 42.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-avi-010.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-PLY-011', 'Plymouth Gin', 'Plymouth', 41.20, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-ply-011.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-SEA-012', 'Seagram''s Extra Dry Gin', 'Seagram''s', 40.00, 750, 12.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-sea-012.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-NOL-013', 'Nolet''s Silver Dry Gin', 'Nolet''s', 47.60, 750, 39.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-nol-013.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-BUL-014', 'Bulldog London Dry Gin', 'Bulldog', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-bul-014.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-TAN-015', 'Tanqueray No. Ten', 'Tanqueray', 47.30, 750, 39.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-tan-015.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-BOM-016', 'Bombay Bramble Gin', 'Bombay', 37.50, 750, 23.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-bom-016.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-MAL-017', 'Malfy Gin Originale', 'Malfy', 41.00, 750, 27.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-mal-017.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-GIN-018', 'Gin Mare Mediterranean Gin', 'Gin Mare', 42.70, 750, 38.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-gin-018.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-STR-019', 'Stranger & Sons Indian Gin', 'Stranger & Sons', 42.80, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-str-019.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Gin'), 'GIN-JAI-020', 'Jaisalmer Indian Craft Gin', 'Jaisalmer', 43.00, 750, 39.99, FLOOR(5 + RAND() * 196), 10, '/static/products/gin-jai-020.jpg');

-- Tequila (20 products)
INSERT IGNORE INTO product_inventory
  (category_id, sku, name, brand, abv, volume_ml, price, quantity_in_stock, reorder_level, image_url) VALUES
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-PAT-001', 'Patron Silver', 'Patron', 40.00, 750, 49.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-pat-001.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-JOS-002', 'Jose Cuervo Especial Gold', 'Jose Cuervo', 40.00, 750, 19.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-jos-002.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-DON-003', 'Don Julio Blanco', 'Don Julio', 40.00, 750, 49.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-don-003.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-CAS-004', 'Casamigos Blanco', 'Casamigos', 40.00, 750, 44.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-cas-004.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-ESP-005', 'Espolon Blanco', 'Espolon', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-esp-005.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-HER-006', 'Herradura Reposado', 'Herradura', 40.00, 750, 39.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-her-006.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-180-007', '1800 Silver', '1800', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-180-007.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-LUN-008', 'Lunazul Blanco', 'Lunazul', 40.00, 750, 19.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-lun-008.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-TER-009', 'Teremana Blanco', 'Teremana', 40.00, 750, 27.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-ter-009.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-HOR-010', 'Hornitos Plata', 'Hornitos', 40.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-hor-010.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-SAU-011', 'Sauza Silver', 'Sauza', 40.00, 750, 14.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-sau-011.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-OLM-012', 'Olmeca Altos Plata', 'Olmeca Altos', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-olm-012.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-MIL-013', 'Milagro Silver', 'Milagro', 40.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-mil-013.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-AVI-014', 'Avion Silver', 'Avion', 40.00, 750, 39.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-avi-014.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-CLA-015', 'Clase Azul Reposado', 'Clase Azul', 40.00, 750, 169.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-cla-015.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-FOR-016', 'Fortaleza Blanco', 'Fortaleza', 40.00, 750, 54.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-for-016.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-ELJ-017', 'El Jimador Blanco', 'El Jimador', 40.00, 750, 19.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-elj-017.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-TRE-018', 'Tres Generaciones Plata', 'Tres Generaciones', 40.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-tre-018.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-CAZ-019', 'Cazadores Reposado', 'Cazadores', 40.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-caz-019.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Tequila'), 'TEQ-COD-020', 'Codigo 1530 Rosa', 'Codigo 1530', 38.00, 750, 59.99, FLOOR(5 + RAND() * 196), 10, '/static/products/teq-cod-020.jpg');

-- Brandy & Cognac (20 products)
INSERT IGNORE INTO product_inventory
  (category_id, sku, name, brand, abv, volume_ml, price, quantity_in_stock, reorder_level, image_url) VALUES
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-HEN-001', 'Hennessy VS Cognac', 'Hennessy', 40.00, 750, 39.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-hen-001.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-HEN-002', 'Hennessy VSOP Privilege', 'Hennessy', 40.00, 750, 59.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-hen-002.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-REM-003', 'Remy Martin VSOP', 'Remy Martin', 40.00, 750, 54.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-rem-003.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-REM-004', 'Remy Martin 1738 Accord Royal', 'Remy Martin', 40.00, 750, 59.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-rem-004.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-COU-005', 'Courvoisier VS', 'Courvoisier', 40.00, 750, 34.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-cou-005.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-COU-006', 'Courvoisier VSOP', 'Courvoisier', 40.00, 750, 44.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-cou-006.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-MAR-007', 'Martell VS', 'Martell', 40.00, 750, 36.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-mar-007.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-MAR-008', 'Martell VSOP', 'Martell', 40.00, 750, 54.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-mar-008.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-CAM-009', 'Camus VSOP Elegance', 'Camus', 40.00, 750, 49.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-cam-009.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-HIN-010', 'Hine Rare VSOP', 'Hine', 40.00, 750, 54.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-hin-010.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-EJX-011', 'E&J VS Brandy', 'E&J', 40.00, 750, 14.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-ejx-011.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-PAU-012', 'Paul Masson Grande Amber VS', 'Paul Masson', 40.00, 750, 12.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-pau-012.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-CHR-013', 'Christian Brothers Brandy', 'Christian Brothers', 40.00, 750, 11.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-chr-013.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-COU-014', 'Courvoisier XO', 'Courvoisier', 40.00, 750, 119.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-cou-014.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-HEN-015', 'Hennessy XO', 'Hennessy', 40.00, 750, 199.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-hen-015.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-MAN-016', 'Mansion House Brandy', 'Mansion House', 42.80, 750, 9.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-man-016.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-HON-017', 'Honey Bee Brandy', 'Honey Bee', 42.80, 750, 8.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-hon-017.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-MOR-018', 'Morpheus Blended Brandy', 'Morpheus', 42.80, 750, 17.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-mor-018.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-EMP-019', 'Emperador Brandy', 'Emperador', 36.00, 750, 12.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-emp-019.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Brandy & Cognac'), 'BRN-TOR-020', 'Torres 10 Gran Reserva', 'Torres', 38.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/brn-tor-020.jpg');

-- Liqueur (20 products)
INSERT IGNORE INTO product_inventory
  (category_id, sku, name, brand, abv, volume_ml, price, quantity_in_stock, reorder_level, image_url) VALUES
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-BAI-001', 'Baileys Original Irish Cream', 'Baileys', 17.00, 750, 27.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-bai-001.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-JAG-002', 'Jagermeister Herbal Liqueur', 'Jagermeister', 35.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-jag-002.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-KAH-003', 'Kahlua Coffee Liqueur', 'Kahlua', 20.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-kah-003.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-APE-004', 'Aperol Aperitivo', 'Aperol', 11.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-ape-004.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-CAM-005', 'Campari Bitter Aperitivo', 'Campari', 25.00, 750, 27.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-cam-005.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-COI-006', 'Cointreau Orange Liqueur', 'Cointreau', 40.00, 750, 36.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-coi-006.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-GRA-007', 'Grand Marnier Cordon Rouge', 'Grand Marnier', 40.00, 750, 44.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-gra-007.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-DIS-008', 'Disaronno Amaretto', 'Disaronno', 28.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-dis-008.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-FIR-009', 'Fireball Cinnamon Whisky', 'Fireball', 33.00, 750, 14.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-fir-009.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-CHA-010', 'Chambord Black Raspberry Liqueur', 'Chambord', 16.50, 750, 34.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-cha-010.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-STG-011', 'St-Germain Elderflower Liqueur', 'St-Germain', 20.00, 750, 34.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-stg-011.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-FRA-012', 'Frangelico Hazelnut Liqueur', 'Frangelico', 20.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-fra-012.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-DRA-013', 'Drambuie Scotch Liqueur', 'Drambuie', 40.00, 750, 34.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-dra-013.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-MID-014', 'Midori Melon Liqueur', 'Midori', 20.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-mid-014.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-LUX-015', 'Luxardo Sambuca dei Cesari', 'Luxardo', 38.00, 750, 25.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-lux-015.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-VIL-016', 'Villa Massa Limoncello', 'Villa Massa', 30.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-vil-016.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-SOU-017', 'Southern Comfort Original', 'Southern Comfort', 35.00, 750, 19.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-sou-017.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-TIA-018', 'Tia Maria Coffee Liqueur', 'Tia Maria', 20.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-tia-018.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-PIM-019', 'Pimm''s No. 1 Cup', 'Pimm''s', 25.00, 750, 22.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-pim-019.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Liqueur'), 'LIQ-CHA-020', 'Green Chartreuse', 'Chartreuse', 55.00, 750, 69.99, FLOOR(5 + RAND() * 196), 10, '/static/products/liq-cha-020.jpg');

-- Wine (20 products)
INSERT IGNORE INTO product_inventory
  (category_id, sku, name, brand, abv, volume_ml, price, quantity_in_stock, reorder_level, image_url) VALUES
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-BAR-001', 'Barefoot Cabernet Sauvignon', 'Barefoot', 13.50, 750, 7.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-bar-001.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-JOS-002', 'Josh Cellars Cabernet Sauvignon', 'Josh Cellars', 13.50, 750, 16.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-jos-002.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-KEN-003', 'Kendall-Jackson Vintner''s Reserve Chardonnay', 'Kendall-Jackson', 13.50, 750, 16.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-ken-003.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-CLO-004', 'Cloudy Bay Sauvignon Blanc', 'Cloudy Bay', 13.00, 750, 29.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-clo-004.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-YEL-005', 'Yellow Tail Shiraz', 'Yellow Tail', 13.50, 750, 7.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-yel-005.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-MEI-006', 'Meiomi Pinot Noir', 'Meiomi', 13.80, 750, 21.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-mei-006.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-LAC-007', 'La Crema Sonoma Coast Pinot Noir', 'La Crema', 14.00, 750, 21.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-lac-007.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-SAN-008', 'Santa Margherita Pinot Grigio', 'Santa Margherita', 12.50, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-san-008.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-WHI-009', 'Whispering Angel Rose', 'Whispering Angel', 13.00, 750, 24.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-whi-009.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-MOE-010', 'Moet & Chandon Imperial Brut', 'Moet & Chandon', 12.00, 750, 54.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-moe-010.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-VEU-011', 'Veuve Clicquot Yellow Label Brut', 'Veuve Clicquot', 12.00, 750, 64.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-veu-011.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-DOM-012', 'Dom Perignon Vintage Brut', 'Dom Perignon', 12.50, 750, 219.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-dom-012.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-LAM-013', 'La Marca Prosecco', 'La Marca', 11.00, 750, 18.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-lam-013.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-CHA-014', 'Chateau Ste. Michelle Riesling', 'Chateau Ste. Michelle', 12.00, 750, 12.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-cha-014.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-PEN-015', 'Penfolds Bin 389 Cabernet Shiraz', 'Penfolds', 14.50, 750, 59.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-pen-015.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-OYS-016', 'Oyster Bay Sauvignon Blanc', 'Oyster Bay', 12.50, 750, 14.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-oys-016.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-APO-017', 'Apothic Red Blend', 'Apothic', 13.50, 750, 12.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-apo-017.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-ROB-018', 'Robert Mondavi Private Selection Merlot', 'Robert Mondavi', 13.50, 750, 11.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-rob-018.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-SUL-019', 'Sula Rasa Shiraz', 'Sula', 13.50, 750, 17.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-sul-019.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Wine'), 'WIN-GRO-020', 'Grover Zampa La Reserve', 'Grover Zampa', 13.50, 750, 18.99, FLOOR(5 + RAND() * 196), 10, '/static/products/win-gro-020.jpg');

-- Beer (20 products)
INSERT IGNORE INTO product_inventory
  (category_id, sku, name, brand, abv, volume_ml, price, quantity_in_stock, reorder_level, image_url) VALUES
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-BUD-001', 'Budweiser Lager', 'Budweiser', 5.00, 330, 1.99, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-bud-001.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-HEI-002', 'Heineken Lager', 'Heineken', 5.00, 330, 2.29, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-hei-002.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-COR-003', 'Corona Extra', 'Corona', 4.60, 355, 2.29, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-cor-003.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-GUI-004', 'Guinness Draught Stout', 'Guinness', 4.20, 440, 2.99, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-gui-004.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-STE-005', 'Stella Artois Lager', 'Stella Artois', 5.00, 330, 2.29, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-ste-005.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-KIN-006', 'Kingfisher Premium Lager', 'Kingfisher', 4.80, 650, 2.99, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-kin-006.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-BIR-007', 'Bira 91 White Ale', 'Bira 91', 4.70, 330, 2.49, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-bir-007.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-CAR-008', 'Carlsberg Pilsner', 'Carlsberg', 5.00, 330, 1.99, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-car-008.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-COO-009', 'Coors Light', 'Coors', 4.20, 355, 1.79, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-coo-009.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-MIL-010', 'Miller Lite', 'Miller', 4.20, 355, 1.79, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-mil-010.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-MOD-011', 'Modelo Especial', 'Modelo', 4.40, 355, 2.29, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-mod-011.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-BLU-012', 'Blue Moon Belgian White', 'Blue Moon', 5.40, 355, 2.49, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-blu-012.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-SIE-013', 'Sierra Nevada Pale Ale', 'Sierra Nevada', 5.60, 355, 2.49, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-sie-013.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-SAM-014', 'Samuel Adams Boston Lager', 'Samuel Adams', 5.00, 355, 2.29, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-sam-014.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-HOE-015', 'Hoegaarden Witbier', 'Hoegaarden', 4.90, 330, 2.99, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-hoe-015.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-PER-016', 'Peroni Nastro Azzurro', 'Peroni', 5.10, 330, 2.49, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-per-016.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-ASA-017', 'Asahi Super Dry', 'Asahi', 5.00, 330, 2.49, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-asa-017.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-SAP-018', 'Sapporo Premium Beer', 'Sapporo', 4.90, 330, 2.49, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-sap-018.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-TIG-019', 'Tiger Beer', 'Tiger', 5.00, 330, 2.29, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-tig-019.jpg'),
  ((SELECT category_id FROM product_category WHERE name = 'Beer'), 'BER-MIC-020', 'Michelob Ultra', 'Michelob', 4.20, 355, 1.99, FLOOR(5 + RAND() * 196), 10, '/static/products/ber-mic-020.jpg');

SELECT c.name AS category, COUNT(*) AS products, SUM(p.quantity_in_stock) AS units
FROM product_inventory p JOIN product_category c ON c.category_id = p.category_id
GROUP BY c.name ORDER BY c.name;
