module BlogsHelper
   def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end


  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code,language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayfied =CodeRayify.new(filter_hmtl: true, hard_wrap: true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayfied, options)
    markdown_to_html.render(text).html_safe
  end


end
