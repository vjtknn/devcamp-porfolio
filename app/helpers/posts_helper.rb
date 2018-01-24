module PostsHelper

  def gravatar_helper user
    image_tag "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 50
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end


  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
      quote: true,
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  def post_status_color post
     'color: red' if post.draft?
  end
end
