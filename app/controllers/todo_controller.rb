class TodoController < ApplicationController

  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todo
  def index
    @todos = Todo.where(user_id: current_user.id).order(:creation_date)

    if @todos.present?
      render json: TodoHelper.json_response(@todos.to_a)
    else
      render json: {
        id: 'no_todos_for_current_user',
        message: 'There is no todos to complete...'
      }
    end
  end

  # GET /todo/:id
  def show
    if @todo.present?
      render json: TodoHelper.json_response(@todo)
    else
      not_matched_response
    end

  end

  # POST /todo
  def create
    create_params = todo_params
    create_params[:user_id] = current_user.id
    @todo = Todo.create!(create_params)

    render json: {
      id: 'todo_item_created',
      message: "Todo with id: #{@todo.id} was succesfully created."
    }
  end

  # PUT /todo/:id
  def update
    if @todo.present?
      @todo.update(todo_params)
      render json: {
        id: 'todo_item_updated',
        message: "Todo with id: #{@todo.id} was succesfully updated."
      }
    else
      not_matched_response
    end

  end

  # DELETE /todo/:id
  def destroy
    if @todo.present?
      @todo.destroy
      render json: {
        id: 'todo_item_deleted',
        message: "Todo with id: #{@todo.id} was succesfully destroyed."
      }
    else
      not_matched_response
    end
  end

  private

  def todo_params
    params.permit(:text, :marked_done, :creation_date)
  end

  def set_todo
    @todo = Todo.find_by(id: params[:id], user_id: current_user.id)
  end

  def not_matched_response
    render json: {
      id: 'todo_not_matched',
      message: 'This todo does not exist.'
    }
  end

end
