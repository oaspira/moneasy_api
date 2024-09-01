class Api::V1::EntryTypesController < ApplicationController
  before_action :set_entry_type, only: %i[show]

  def index
    authorize EntryType

    @entry_types = EntryType.all
    render json: @entry_types, status: :ok
  end

  def show
  end

  private

  def set_entry_type
    entry_type = EntryType.find_by(id: params[:id])
    return render json: { errors: t('activerecord.errors.messages.item_not_found') }, status: :not_found unless entry_type

    authorize EntryType
    @entry_type = entry_type
  end
end
