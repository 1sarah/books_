class BookReadingWishlistController < ApplicationController
        def index
          @reading_list = BookReadingWishlist.find(params[:id])
          @books = @reading_list.books
        end
      
        def update
          @reading_list = BookReadingWishlist.find(params[:id])
          @reading_list.update(reading_list_params)
          redirect_to reading_list_path(@reading_list)
        end
      
        private
      
        def reading_list_params
          params.require(:reading_list).permit(:name)
        end
      end
      