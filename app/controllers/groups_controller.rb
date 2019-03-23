class GroupsController < ApplicationController

    def index
        @groups =Group.all
        @group = Group.new

    end

    def create
        @user_id=1;
        @group = Group.new(group_params)
        @group.user_id=@user_id
        @group.save
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
           puts params.require(:group).permit(:name,:user,:id)
        end

end
