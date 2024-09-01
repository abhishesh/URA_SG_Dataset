CREATE TABLE ura AS
SELECT *
FROM read_csv_auto('dataset/to_merge/combined.csv', null_padding = true);

SELECT
    "Floor Area (SQFT)" AS floor_area,
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '01') AS "1",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '02') AS "2",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '03') AS "3",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '04') AS "4",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '05') AS "5",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '06') AS "6",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '07') AS "7",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '08') AS "8",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '09') AS "9",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '10') AS "10",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '11') AS "11",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '12') AS "12",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '13') AS "13",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '14') AS "14",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '15') AS "15",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '16') AS "16",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '17') AS "17",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '18') AS "18",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '19') AS "19",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '20') AS "20",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '21') AS "21",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '22') AS "22",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '23') AS "23",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '24') AS "24",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '25') AS "25",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '26') AS "26",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
    ) FILTER (WHERE "Postal District" = '27') AS "27",
    quantile_cont(
        cast(replace("Monthly Rent ($)", ',', '') AS DOUBLE), 0.5
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
                replace(
                    substring(
                        floor_area FROM 1 FOR position(' ' IN floor_area) - 1
                    ),
                    ',',
                    ''
                ) AS INTEGER
            )
    END;
