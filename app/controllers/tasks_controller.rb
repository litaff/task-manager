class TasksController < ApplicationController
    def new
        @task = Task.new
    end

    def create
        @task = Task.create(task_params(:name, :description, :bucket_id))
        @task.status = "Pending"
        @task.save
        redirect_to task_path(@task)
    end

    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = Task.find(params[:id])
        if @task.blank?
            redirect_to root_path
        end
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params(:name, :description, :status, :bucket_id))
        redirect_to task_path(@task)
    end

    def destroy
        @task = Task.find(params[:id]).destroy
        redirect_to buckets_path(@task.bucket_id)
    end

    private
    def task_params(*args)
        params.require(:task).permit(*args)
    end
end
