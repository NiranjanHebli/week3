## Prompt:-

Design a relational database schema for a ride-sharing app similar to Uber or Ola Cabs. Include:

An ER diagram description with at least 5 entities and relationship cardinalities.

Normalized tables up to 3NF with primary keys and foreign keys.

A brief explanation of normalization decisions.

Five SQL queries on the schema using window functions (such as ROW_NUMBER(), RANK(), LAG(), LEAD(), SUM() OVER()), with expected purpose explained.

Example use cases such as trip history, driver earnings, surge pricing, top customers, and ride cancellation trends.


## AI - Generated Output:-

### [ChatGPT Response](https://chatgpt.com/s/t_69b823c9e79481919d8b0d1a726c64ab)


# Is the schema in 3NF?

Yes, the schema is in Third Normal Form (3NF) because each table satisfies the normalization rules:

- All attributes contain atomic values (1NF)
- No partial dependency exists because every non-key attribute depends on the full primary key (2NF)
- No transitive dependency exists because non-key attributes depend only on the primary key (3NF)


# Are there missing relationships?

Yes, two important relationships are missing.

## Missing relationship 1: Ride and SurgePricing

Currently, surge pricing is stored separately but not linked to rides. A foreign key such as surge_id should be added in the Ride table so each ride records which surge multiplier applied.

## Missing relationship 2: Driver and Vehicle assignment history

A driver may change vehicles over time, but the current schema stores only one direct link. A separate assignment table is better for maintaining history.

## Query 1: Driver earnings ranking

```sql 
SELECT driver_id,
SUM(fare) AS total_earnings,
RANK() OVER (ORDER BY SUM(fare) DESC) AS rank_no
FROM Ride
GROUP BY driver_id;
```


## Query 2: Rider trip sequence

```sql
SELECT rider_id,
ride_id,
ROW_NUMBER() OVER (PARTITION BY rider_id ORDER BY request_time) AS trip_no
FROM Ride;
```


