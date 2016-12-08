# app/graph/types/profile_type.rb
ProfileType = GraphQL::ObjectType.define do
  name 'Profile'
  description 'user profile information'

  field :user_id, !types.String, 'Validic user ID', hash_key: 'user_id'
  field :customer_id, !types.String, 'Validic customer ID', hash_key: 'customer_id'
  field :uid, !types.String, 'Source user ID', hash_key: 'uid'
end
