class Backend::ProductController < ApplicationController

	def index		
		@products = Product.all
	end

	def show
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def edit
	end

	def update
	end
end
