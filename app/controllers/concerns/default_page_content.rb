module DefaultPageContent
	extend ActiveSupport::Concern
	included do
		before_action :set_title
	end

	def set_title
		@page_title="DevcampPortfolio | My Portfolio Website"	
		@seo_keywords="Maria Makantasi's portfolio"
	end
end