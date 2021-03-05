class TodosController < ApplicationController
  before_action :set_todo, only: [:update, :destroy]

  def index
    todos=Todo.select('id','title','detail','date').order(updated_at: 'asc')
    json_response(todos)
  end

  def create
    todo = Todo.create!(todo_params)
    json_response(todo, :created)
  end

  def update
    @todo.update(todo_params)
    head :no_content
  end

  def destroy
    @todo.destroy!
    head :no_content
  end

  private

  def todo_params
    params.permit(:title,:detail,:date)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end