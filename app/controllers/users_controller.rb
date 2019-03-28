class UsersController < ApplicationController

    def destroy

            @group_id = params[:id]
            @user_id = params[:group_id]
            @gu = UserGroup.find_by(user_id: @user_id, group_id: @group_id)
            @gu.destroy
            redirect_to groups_path

    end

end
