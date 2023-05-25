class BucketsController < ApplicationController
    before_action :authenticate_user!

    def new
        @bucket = Bucket.new
    end

    def show
        @bucket = Bucket.get_by_owner(current_user.id)
        if @bucket.blank?
            auto_create
        end
    end

    def auto_create
        @bucket = Bucket.new
        @bucket.name = current_user.email
        @bucket.user_id = current_user.id
        @bucket.save
        redirect_to bucket_path(@bucket)
    end
end
