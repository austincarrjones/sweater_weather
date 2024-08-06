class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :id
end
