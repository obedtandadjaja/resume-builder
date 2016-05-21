json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :display_name, :street_address, :zip, :city, :state, :email, :phone
  json.url user_url(user, format: :json)
end
