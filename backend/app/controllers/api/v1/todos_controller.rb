class Api::V1::TodosController < ApplicationController
  def index
    render json: { status: 200, message: "success", todos: Todo.all }
  end

  def create
    todo = Todo.new(todo_params)

    if todo.save
      render json: { status: 200, message: "success", todo: todo }
    else
      render json: { status: 500, message: todo.errors, todo: nil }
    end
  end

  def destroy
    todo = Todo.find(params[:id])

    if todo.destroy
      render json: { status: 200, message: "success", todo: todo }
    else
      render json: { status: 500, message: todo.errors, todo: nil }
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:title)
    end
end
