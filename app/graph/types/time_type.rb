# app/graph/types/time_type.rb
TimeType = GraphQL::ObjectType.define do
  name 'Time'
  description 'Timestamp information'

  field :type,        !types.String, 'Source type',   resolve: -> (o, _a, _c) { o.type }
  field :time,        !types.String, 'Source type',   resolve: -> (o, _a, _c) { o.time }
  field :user_offset, !types.String, 'Source type',   resolve: -> (o, _a, _c) { o.offset }
end
