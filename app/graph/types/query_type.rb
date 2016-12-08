# app/graph/types/query_type.rb
QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The Validic query root'

  field :summaries do
    type types[SummaryType]
    description 'Summary'

    argument :user_id, !types.String, 'The user'
    argument :date,    types.String,  'The date'
    argument :source,  types.String,  'If provided returns only readings from the specified source'

    resolve -> (_obj, args, _ctx) do
      query = {}
      query['user_id'] = args[:user_id] if args[:user_id]
      query['date']    = args[:date]    if args[:date]
      query['soure']   = args[:source]  if args[:source]
      Summary.where(query)
    end
  end
end
