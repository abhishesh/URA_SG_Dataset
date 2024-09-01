CREATE TABLE ura AS
SELECT *
FROM read_csv_auto('dataset/district/combined.csv', null_padding = true);

SELECT
    "Floor Area (sq ft)" AS floor_area,
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '01') AS "1",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '02') AS "2",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '03') AS "3",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '04') AS "4",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '05') AS "5",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '06') AS "6",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '07') AS "7",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '08') AS "8",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '09') AS "9",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '10') AS "10",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '11') AS "11",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '12') AS "12",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '13') AS "13",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '14') AS "14",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '15') AS "15",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '16') AS "16",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '17') AS "17",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '18') AS "18",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '19') AS "19",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '20') AS "20",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '21') AS "21",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '22') AS "22",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '23') AS "23",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '24') AS "24",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '25') AS "25",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '26') AS "26",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '27') AS "27",
    percentile_cont(0.5) WITHIN GROUP (
        ORDER BY "Monthly Gross Rent($)"
    ) FILTER (WHERE "Postal District" = '28') AS "28"
FROM
    ura
GROUP BY
    floor_area
ORDER BY
    CASE
        WHEN floor_area LIKE '<=%' THEN 0  -- Handling '<= 200'
        WHEN floor_area LIKE '>%' THEN 3001 -- Handling '>3000'
        ELSE
            cast(
                substring(
                    floor_area FROM 1 FOR position(' ' IN floor_area) - 1
                ) AS INTEGER
            )
    END;
