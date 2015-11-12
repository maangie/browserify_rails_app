class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit]

  # GET /todos
  # GET /todos.json
  def index
    @todos = []
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.new(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the
    # white list through.
    def todo_params
      params.require(:todo).permit(:title, :content, :todo_date)
    end
end
