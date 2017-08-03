def index
  @products = Product.where(nil)
  filtering_params(params).each do |key, value|
    @products = @products.public_send(key, value) if value.present?
  end
end

private

# A list of the param names that can be used for filtering the Product list
def filtering_params(params)
  params.slice(:status, :location, :starts_with)
end