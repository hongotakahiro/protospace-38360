class UsersController < ApplicationController
    def show
        @prototypes = Prototype.all 
        user = User.find(params[:id])
    end

      private

      def message_params
        params.require(:prototype).permit(:image).merge(user_id: current_user.id)
      end
    end
    
