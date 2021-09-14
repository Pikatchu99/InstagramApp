class FavoritesController < ApplicationController
  def create
     favorite = current_user.favorites.create(post_id: params[:post_id])
     redirect_to posts_path, notice: "Le blog  de #{favorite.post.user.name} a été ajouté aux favoris"
 end
 def destroy
   favorite = current_user.favorites.find_by(id: params[:id]).destroy
   redirect_to posts_path, notice: "Le Blog de #{favorite.post.user.name} a été supprimé des favoris"
 end
end
