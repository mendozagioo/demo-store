module Backend::ProductHelper

	def display_inventory product
		product.inventory == -1? '∞' : product.inventory
	end

end