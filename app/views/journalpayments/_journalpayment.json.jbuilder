json.extract! journalpayment, :id, :journal, :amount, :isPaid, :created_at, :updated_at
json.url journalpayment_url(journalpayment, format: :json)
