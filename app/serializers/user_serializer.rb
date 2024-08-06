class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :id, :api_key
end
