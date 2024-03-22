# Commands List

## Mix

```bash
mix archieve.install hex phx_new
# mix phx.new hello --no-ecto
mix phx.new toshiba-wl --database sqlite3
```

## Phoenix

- `cd /hello`

```bash
mix phx.routes
mix phx.server
```

### Generators

```bash
mix phx.gen.html Hris Employee employees name:string project_id:integer department:string

mix phx.gen.live Hris Employee employees name:string project_id:integer department:string
```

## Curl

```bash
curl -i \
  -H 'Content-type: application/json' \
  http://localhost:4000/dev/dashboard/metrics
```
