# graphql_poc
proof of concept for graph ql

## Setup

1. Clone project
2. Run `bundle`
3. Run `bundle exec rake db:setup db:migrate db:seed`


## SQL Queries:

### Joining summaries and metrics table:

`SELECT * FROM summaries s JOIN metrics m ON s.id=m.summary_id;`

### Join and filter on metric type:

`SELECT * FROM summaries s JOIN metrics m ON s.id=m.summary_id WHERE m.data ->> 'type' = 'distance';`

### Join and filter on multiple metric types:

`SELECT * FROM summaries s JOIN metrics m ON s.id=m.summary_id WHERE s.id=1 AND m.data->'type' ?| ARRAY['steps','spo2'];`

### Join and filter on metric type and metric value:

`SELECT * FROM summaries s JOIN metrics m ON s.id=m.summary_id WHERE s.id=1 AND m.data ->> 'type' = 'steps' AND m.data ->> 'value' > '100';`

### Declare specific columns from JSON data:

`SELECT s.user_id, m.data::jsonb->'type',m.data::jsonb->'value',m.data::jsonb->'unit' FROM summaries s JOIN metrics m ON s.id=m.summary_id WHERE s.id=1 AND m.data ->> 'type' = 'steps' AND m.data ->> 'value' > '100';`