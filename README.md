# Mimir project

A kanban boards control system

## Run with Docker

Run and build:
```
  docker compose up --build
```

To clear the database:
```
  docker compose exec mimir-web bundle exec rails db:drop db:prepare
```

### Locations
Web location: 127.0.0.1:3000

PostrgeSQL location: 127.0.0.1:5432

