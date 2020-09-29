class TasksController < ApplicationController
    
    before_action :require_user_logged_in
    
    def index
        #@tasks = Task.all
        @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    end 

    def show
        @task = Task.find(params[:id])
    end 

    def new
        #@task = Task.new
        @task = current_user.tasks.build
    end 
    
   def create
       @task = current_user.tasks.build(tasks_params)
        if @task.save
            flash[:success] = 'Taskを投稿しました。'
            redirect_to root_url
        else
            @tasks = current_user.tasks.order(id: :desc).page(params[:page])
            flash.now[:danger] = 'Taskの投稿に失敗しました。'
            render root_url
        end
    end
    
    def edit
        @task = Task.find(params[:id])
    end 
    
    def update
        @task = Task.find(params[:id])
        
        if @task.update(tasks_params)
            flash[:success] = "Taskは正常に更新されました"
            redirect_to @task
        else
            flash.now[:danger] = "Taskは更新されませんでした"
            render :edit
        end
    end 
    
    def destroy 
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = "Taskは正常に削除されました"
        redirect_to tasks_url
    end 
    
    private
    #private以降に定義されたメソッドはアクションではなく、このクラス内のみで使用するメソッドとして扱われる
    
    #Strong Parameter
    def tasks_params
        params.require(:task).permit(:content, :status)
    end 

end
