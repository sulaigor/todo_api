class TodoController < ApplicationController

  before_action :bad_params_id, :set_todo, only: [:show, :update, :destroy]

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

  def show
    if @todo.present?
      render json: TodoHelper.json_response(@todo, params)
    else
      not_matched_response
    end

  end

  def create
    create_params = todo_params
    create_params[:user_id] = current_user.id
    @todo = Todo.create!(create_params)

    render json: {
      id: 'todo_item_created',
      message: "Todo with date #{@todo.date} was succesfully created.",
      todo_date: @todo.date,
      todo_text: @todo.text,
    }
  end

  def update
    if @todo.present?
      @todo.update(todo_params)
      render json: {
        id: 'todo_item_updated',
        message: "Todo with date #{@todo.date} was succesfully updated.",
        todo_date: @todo.date,
        todo_text: @todo.text,
      }
    else
      not_matched_response
    end

  end

  def destroy
    if @todo.present?
      @todo.destroy
      render json: {
        id: 'todo_item_deleted',
        message: "Todo with date #{@todo.date} was succesfully destroyed.",
        todo_date: @todo.date,
        todo_text: @todo.text,
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
    @todo = Todo.where(user_id: current_user.id).order(:creation_date)[params[:id].to_i - 1]
  end

  def not_matched_response
    render json: {
      id: 'todo_not_matched',
      message: 'This todo does not exist.'
    }
  end

  def bad_params_id
    if params[:id].to_i < 1
      render json: {
        id: 'bad_params_id',
        message: 'Params id must be 1 or higher.'
      }
    end
  end

end
