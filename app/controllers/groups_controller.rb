class GroupsController < ApplicationController
   
    def index
        @groups =Group.where(user_id: current_user.id)
        @group = Group.new
    end

  

    def create
        @group = Group.new(group_params)
        @group.user_id=current_user.id
        @group.save
        # render plain: params.inspect
        redirect_to groups_path
    end

    def show
      @group = Group.find(params[:id])       
    end

    # def edit

    # end

    # def update

    # end

    def destroy
      @group = Group.find(params[:id])
      @group.destroy
      redirect_to groups_path
    end


    private 
        def group_params
            params.require(:group).permit(:name,:user_id)
        end

end
