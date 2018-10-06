class LinksController < InheritedResources::Base
  respond_to :html

  actions :all

  def increment_clicked_count
    respond_to do |format|
      format.js {
        @link = Link.find(params[:id])
        @link.stat_clicked_count += 1
        @link.save
        head :ok, content_type: 'application/json'
      }
    end
  end

  private

  def collection
    @links ||= end_of_association_chain.page(@page_num)
  end

  def permitted_params
    params.permit(
      :link_id,
      link: [
        :full_url
      ]
    )
  end
end
