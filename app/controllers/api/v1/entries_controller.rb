class Api::V1::EntriesController < ApplicationController
  before_action :set_entry, only: %i[show update destroy]

  def index
    authorize Entry

    @entries = Entry.all
    render json: @entries, status: :ok
  end

  def show
  end

  def create
    authorize Entry
    @entry = Entry.new(entry_params)

    if @entry.save
      render :show, status: :ok
    else
      @errors = @entry.errors.messages
      render :errors, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      render :show, status: :ok
    else
      @errors = @entry.errors.messages
      render :errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @entry.destroy
      render :show, status: :ok
    else
      @errors = @entry.errors.messages
      render :errors, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:entry).permit(allowed_params)
  end

  def allowed_params
    %i[
      description
      due_date
      value
      entry_category_id
      entry_status_id
      entry_type_id
      monthly_budget_id
      user_id
      yearly_budget_id
    ]
  end

  def set_entry
    entry = Entry.find_by(id: params[:id])
    return render json: { errors: t('activerecord.errors.messages.item_not_found') }, status: :not_found unless entry

    authorize entry
    @entry = entry
  end
end
