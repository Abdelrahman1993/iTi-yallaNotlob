class GroupsController < ApplicationController

  def index
    @groups = Group.where(user_id: current_user.id)
    @group = Group.new
    @user = User.new
  end

  def create
    @group = Group.new(group_params)
    @groups = Group.where(user_id: current_user.id)
  
    @groupName=@group.name
    @group.user_id = current_user.id
    if(! @group.save)
      $GroupError=[]
      $GroupError.push( @group.errors.full_messages[0].to_s);
    end
    redirect_to groups_path
  end

  def show
    @groups = Group.where(user_id: current_user.id)
    @group = Group.new

# debugger
    if(UserGroup.where(user_id: current_user.id).where(group_id: params[:id]))
      @groupId = Group.find_by(id: params[:id])
      if(@groupId)
        $test =  @groupId.id
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @users = UserGroup.where(group_id: @group.id)
    @users.each do |user|
      user.destroy
    end
    @group.destroy
    redirect_to groups_path

    # @groupId = Group.find(params[:id])
    # @users = UserGroup.where(group_id: @groupId.id)
    # @users.each(&:destroy)
    # @groupId.destroy
    # redirect_to groups_path
  end

 def addUserGroup
  if !params[:friends].empty?
        @friends = params[:friends].split(',')
        @friends.each do |friend|
          @usergroup = UserGroup.new
          @usergroup.user_id = friend
          @usergroup.group_id=$test
          if(!@usergroup.save)
            p "======================"
             p "aaaaaaaaaaaaaaaaaaaaaaaa"
            $GroupError = [];
            $GroupError.push(@usergroup.errors.full_messages[0].to_s)
          end
      end
    else
      $GroupError.push("Please add some users")
    end
      redirect_to groups_path
    end
    
   
    private 
        def group_params
            params.require(:group).permit(:name)
        end   

end