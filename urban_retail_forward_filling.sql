CREATE TABLE corrected_inventory_ff LIKE corrected_inventory;


SET @prev_store := NULL;
SET @prev_product := NULL;
SET @prev_region := NULL;
SET @inv := NULL;
SET @sold := NULL;
SET @ord := NULL;
SET @dem := NULL;
SET @price := NULL;
SET @disc := NULL;
SET @weather := NULL;
SET @holi := NULL;
SET @comp := NULL;
SET @season := NULL; 

INSERT INTO corrected_inventory_ff (
  `Date`, `Store ID`, `Product ID`, `Category`, `Region`,
  `Inventory Level`, `Units Sold`, `Units Ordered`,
  `Demand Forecast`, `Price`, `Discount`,
  `Weather Condition`, `Holiday/Promotion`,
  `Competitor Pricing`, `Seasonality`
)
SELECT
  `Date`,
  `Store ID`,
  `Product ID`,
  `Category`,
  `Region`,
  @inv := IF(is_new_group OR `Inventory Level` IS NOT NULL, `Inventory Level`, @inv) AS `Inventory Level`,
  @sold := IF(is_new_group OR `Units Sold` IS NOT NULL, `Units Sold`, @sold) AS `Units Sold`,
  @ord := IF(is_new_group OR `Units Ordered` IS NOT NULL, `Units Ordered`, @ord) AS `Units Ordered`,
  
  @dem := IF(is_new_group OR `Demand Forecast` IS NOT NULL, `Demand Forecast`, @dem) AS `Demand Forecast`,
  @price := IF(is_new_group OR `Price` IS NOT NULL, `Price`, @price) AS `Price`,
  @disc := IF(is_new_group OR `Discount` IS NOT NULL, `Discount`, @disc) AS `Discount`,
  @weather := IF(is_new_group OR `Weather Condition` IS NOT NULL, `Weather Condition`, @weather) AS `Weather Condition`,
  @holi := IF(is_new_group OR `Holiday/Promotion` IS NOT NULL, `Holiday/Promotion`, @holi) AS `Holiday/Promotion`,
  @comp := IF(is_new_group OR `Competitor Pricing` IS NOT NULL, `Competitor Pricing`, @comp) AS `Competitor Pricing`,
  @season := IF(is_new_group OR `Seasonality` IS NOT NULL, `Seasonality`, @season) AS `Seasonality`
  -- `Demand Forecast`,
--   `Price`,
--   `Discount`,
--   `Weather Condition`,
--   `Holiday/Promotion`,
--   `Competitor Pricing`,
--   `Seasonality`
FROM (
  SELECT *,
    IF(
      `Store ID` = @prev_store AND `Product ID` = @prev_product AND `Region` = @prev_region,
      0,
      1
    ) AS is_new_group,
    @prev_store := `Store ID`,
    @prev_product := `Product ID`,
    @prev_region := `Region`
  FROM (
    SELECT *
    FROM corrected_inventory
    WHERE `Date` BETWEEN '2022-01-01' AND '2023-12-31'
    ORDER BY `Store ID`, `Product ID`, `Region`, `Date`
  ) AS sorted_data
) AS grouped_data;

SELECT *
FROM corrected_inventory_ff
WHERE `Product ID`='P0096' AND `Store ID`='S001' AND `Region`='East'
ORDER BY `Date`, `Store ID`, `Product ID`;


SELECT *
FROM inventory_forecasting
WHERE `Product ID`='P0096' AND `Store ID`='S001' AND `Region`='East'
ORDER BY `Date`, `Store ID`, `Product ID`;




-- FILLING IN THE NULL VALUES FOR THE INITIAL EMPTY ENTRIES
DROP TABLE IF EXISTS corrected_inventory_zeroed;
CREATE TABLE corrected_inventory_zeroed AS
SELECT
  `Date`,
  `Store ID`,
  `Product ID`,
  `Category`,
  `Region`,
IFNULL(`Inventory Level`, 0) AS `Inventory Level`,
  IFNULL(`Units Sold`, 0) AS `Units Sold`,
  IFNULL(`Units Ordered`, 0) AS `Units Ordered`,
  `Demand Forecast`,
 `Price`,
 `Discount`,
   `Weather Condition`,
   `Holiday/Promotion`,
   `Competitor Pricing`,
   `Seasonality`
FROM corrected_inventory_ff;




SELECT *
FROM corrected_inventory_zeroed
WHERE `Product ID`='P0057' AND `Store ID`='S001' AND `Region`='East'
ORDER BY `Date`, `Store ID`, `Product ID`;



