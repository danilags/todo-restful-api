class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all
    response = {
      "data" => @todos,
      "status_code" => 200,
    }
    json_response(response, 200, 'Success')
  end

  

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    
    json_response(@todo, :created, "Berhasil get semua todo")
  end

  # GET /todos/:id
  def show
    puts "Ini show !"
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  def login
    puts "Login berhasil"

  end

  private

  def todo_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
