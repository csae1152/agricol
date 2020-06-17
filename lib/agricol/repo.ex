defmodule Agricol.Repo do
  use Ecto.Repo,
    otp_app: :agricol,
    adapter: Ecto.Adapters.Postgres
end
