class Api::V1::EntryCategoriesController < ApplicationController
  before_action :set_entry_category, only: %i[show update destroy]

  def index
    # authorize EntryCategory

    @entry_categories = EntryCategory.order(:description)
    render json: @entry_categories, status: :ok
  end

  def show
  end

  def create
    # authorize EntryCategory
    @entry_category = EntryCategory.new(entry_category_params)

    if @entry_category.save
      render :show, status: :ok
    else
      @errors = @entry_category.errors.messages
      render :errors, status: :unprocessable_entity
    end
  end

  def update
    if @entry_category.update(entry_category_params)
      render :show, status: :ok
    else
      @errors = @entry_category.errors.messages
      render :errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @entry_category.destroy
      render :show, status: :ok
    else
      @errors = @entry_category.errors.messages
      render :errors, status: :unprocessable_entity
    end
  end

  private

  def entry_category_params
    params.require(:entry_category).permit(allowed_params)
  end

  def allowed_params
    %i[description]
  end

  def set_entry_category
    entry_category = EntryCategory.find_by(id: params[:id])
    return render json: { errors: t('activerecord.errors.messages.item_not_found') }, status: :not_found unless entry_category

    # authorize EntryCategory
    @entry_category = entry_category
  end
end
