# app/graph/types/integer_type.rb
IntegerType = GraphQL::ObjectType.define do
  name 'IntType'
  description 'metric with a value as integer'

  field :unit,       types.String, 'Unit of measure', resolve: -> (o, _a, _c) { o.data['unit'] }
  field :origin,     types.String, 'Data origin',     resolve: -> (o, _a, _c) { o.data['origin'] }
  field :value,      types.Int,    'Data value',      resolve: -> (o, _a, _c) { o.data['value'] }
  field :id,         types.Int,    'id of record',    resolve: -> (o, _a, _c) { o.id }
  field :created_at, types.String, 'creation date',   resolve: -> (o, _a, _c) { o.created_at }
  field :updated_at, types.String, 'updated date',    resolve: -> (o, _a, _c) { o.updated_at }
end
