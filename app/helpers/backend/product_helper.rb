module Backend::ProductHelper

	def display_inventory product
		product.inventory == -1? 'Infinite' : product.inventory
	end

end