defmodule Division.Accounts.Auth do
  alias Division.Accounts.{Encryption, User}

  def login(params, repo) do
    user = repo.get_by(User, username: String.downcase(params["username"]))

    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _ -> :error
    end
  end

  defp authenticate(user, password) do
    if user do
      {:ok, authenticated_user} = Encryption.validate_password(user, password)
      authenticated_user.username == user.username
    else
      nil
    end
  end

  def current_user(conn) do
    conn.assigns[:current_user]
  end

  def signed_in?(conn) do
    case current_user(conn) do
      nil -> false
      _ -> true
    end
  end
end
