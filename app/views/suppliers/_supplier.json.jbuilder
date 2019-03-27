json.extract! supplier, :id, :company, :name, :address, :phone, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
