class Api::V1::EntryStatusesController < ApplicationController
  before_action :set_entry_status, only: %i[show]

  def index
    # authorize EntryStatus

    @entry_statuses = EntryStatus.all
    render json: @entry_statuses, status: :ok
  end

  def show
  end

  private

  def set_entry_status
    entry_status = EntryStatus.find_by(id: params[:id])
    return render json: { errors: t('activerecord.errors.messages.item_not_found') }, status: :not_found unless entry_status

    # authorize EntryStatus
    @entry_status = entry_status
  end
end
