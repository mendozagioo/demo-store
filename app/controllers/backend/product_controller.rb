class Backend::ProductController < ApplicationController

	def show
		@products = Product.all
	end

	def new
	end

	def edit
	end

	def update
	end
end
