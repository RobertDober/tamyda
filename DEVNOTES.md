# Upgrading my MacOS

## Postgres

* `brew upgrade postgres`
    That was from 9.6 to 11

* `brew postgresql-update-database` failed, probably because of the version hub.
    As I did not need the old databases...
* `initdb -D /usr/local/var/postgres`
* `brew services start postgresql` was not opted for (I prefer starting manually inside tmux...)
* `pg_ctl -D /usr/local/var/postgres_start`  aliased to `postgres_start`

## Erlang and Elixir

* `brew upgrade erlang`  OTP -> 21.3.3
* `brew upgrade elixir`  stayed at 1.8.1

## Phoenix

### Basic Installation and Setup

* `mix archive.install hex phx_new 1.4.3`
* `mix phx.new .` answering Y to all questions (is there a `-y|--yes` switch?)
* Database config in `config/dev.exs` and `config/test.exs`
* `mix ecto.create`

### LiveView Setup (still manually)

1. Add dependency from github c.f. `mix.exs`
  - Add {:phoenix_live_reload, "~> 1.2", only: :dev},
  - Run `mix deps.get`
1. Add secret salt generated with `mix phx.gen.secret 64` to `config/config.exs`
1. Register `Phoenix.LiveView.Engine` in `config/config.exs`
1. Add LiveView flash plug to the browser pipeline in `lib/tamyda_web/router.ex`
1. Also add the `put_layout` plug with `{LiveViewCounterWeb.LayoutView, :app}`
1. Import some functions into `view` and `router`  _name spaces_ in `lib/tamyda_web.ex`
  - Namely `import Phoenix.LiveView, only: [live_render: 2, live_render: 3]`
  - And `import Phoenix.LiveView.Router`
1. Expose a websocket in `lib/tamyda_web/endpoint.ex`  with  `socket "/live", Phoenix.LiveView.Socket`
1. Javascript
  - put `"phoenix_live_view": "file:../deps/phoenix_live_view"`into `assets/package.json`
  - update node with `(cd assets && npm install)`
  - connect in `assets/js/app.js`
1. CSS (optionally) `@import live_view.css` into `assets/css/app.css`

Now chek the server with `mix phx.sever` and assure that we have `[info] Replied Phoenix.LiveView.Socket :ok`

### Routing to LiveView

In `lib/tamyda_web/router.ex` 

```elixir
    scope "/", TamydaWeb do
      ...
      live("/", TamydaLive) # to be developed
      ...
    end
```

