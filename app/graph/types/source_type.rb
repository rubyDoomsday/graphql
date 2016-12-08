# app/graph/types/source_type.rb
SourceType = GraphQL::ObjectType.define do
  name 'Source'
  description 'Describes the source of the data'

  field :type,   !types.String, 'Source type', resolve: -> (o, _a, _c) { o.source }
  field :device, DeviceType,    'Device Data', resolve: -> (o, _a, _c) { o }
end
