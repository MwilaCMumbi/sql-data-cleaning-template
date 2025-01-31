-- Data Cleaning SQL Script Template
-- Replace placeholders (e.g., `your_table`, `your_column`) with actual values

-- Step 1: Inspect the data
SELECT *
FROM your_table
LIMIT 10;

-- Step 2: Check for missing values
SELECT *
FROM your_table
WHERE your_column IS NULL;

-- Step 3: Handle missing values (choose one approach)
-- Option 1: Remove rows with missing values
DELETE FROM your_table
WHERE your_column IS NULL;

-- Option 2: Fill missing values with a default value
UPDATE your_table
SET your_column = 'default_value'
WHERE your_column IS NULL;

-- Step 4: Remove duplicates
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY column1, column2, column3 ORDER BY id) AS row_num
    FROM your_table
)
DELETE FROM your_table
WHERE id IN (
    SELECT id
    FROM CTE
    WHERE row_num > 1
);

-- Step 5: Standardize text data (e.g., trim whitespace, convert to lowercase)
UPDATE your_table
SET your_column = TRIM(LOWER(your_column));

-- Step 6: Fix inconsistent data (e.g., replace incorrect values)
UPDATE your_table
SET your_column = 'correct_value'
WHERE your_column = 'incorrect_value';

-- Step 7: Validate data types (ensure columns have the correct data type)
-- Example: Convert a column to the correct data type
ALTER TABLE your_table
ALTER COLUMN your_column TYPE correct_data_type USING your_column::correct_data_type;

-- Step 8: Drop unnecessary columns
ALTER TABLE your_table
DROP COLUMN unnecessary_column;

-- Step 9: Verify cleaned data
SELECT *
FROM your_table
LIMIT 10;

-- Step 10: Save cleaned data (optional, if creating a new table)
CREATE TABLE cleaned_table AS
SELECT *
FROM your_table;

-- End of script
