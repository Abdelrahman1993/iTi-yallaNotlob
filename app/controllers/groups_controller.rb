class GroupsController < ApplicationController
   
    def index
        @groups =Group.all
        @group = Group.new
        @user=User.new
       
    end

    def create
        # render plain: params.inspect
        @user_id=1;
        @group = Group.new(group_params)
        @group.user_id=@user_id
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
      @users = UserGroup.where(group_id: @group.id)
      @users.each do |user|
        user.destroy
      end
      @group.destroy
      redirect_to groups_path
    end

    def addUserGroup
        #    @userId = User.where(name: name)
        # usergroup_params[:name]
            @usergroup=UserGroup.new(usergroup_params)

            # render plain: params.inspect
            # redirect_to groups_path
        end

    private 
        def group_params
            params.require(:group).permit(:name,:user_id)
        end

        def usergroup_params
            params.require(:group).permit(:name)
        end

end
