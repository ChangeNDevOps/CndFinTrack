class Member::ApplicationController < ApplicationController
  helper_method :datum_name
  helper_method :back_path
  before_action :set_items
  before_action :set_item, only: [ :show, :edit, :update, :destroy ]
  layout 'application'

  def index
    @pagy, @items = pagy(datum.all)
  end

  def show
    # @item = datum.find(params[:id])
  end

  def edit
  end

  def new
    @item = datum.new
    logger.debug @item.to_json
  end

  def create
    @item = datum.new(item_params)
    before_create_call_back
    if @item.save
      after_create_call_back
      redirect_to back_path, notice: "#{datum_name.capitalize} #{t('globals.created')}."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    logger.debug 'Update'.green
    before_update_call_back
    if @item.update(item_params)
      after_update_call_back
      redirect_to back_path, notice: "#{datum_name.capitalize} #{t('globals.updated')}."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.respond_to?(:status)
      @item.archived!
      @item = nil
    else
      @item.destroy!
    end
    redirect_to back_path, status: :see_other, notice: "#{datum_name.capitalize} #{t('globals.destroyed')}."
  end

  private

  def back_path; end

  def set_items; end

  def log_history; end

  def before_create_call_back; end

  def before_update_call_back; end

  def after_create_call_back; end

  def after_update_call_back; end

  def set_item
    return unless respond_to?(:datum, true)

    @item = datum.find(params.expect(:id))
  end
end
