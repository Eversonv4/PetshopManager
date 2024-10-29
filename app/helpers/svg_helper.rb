module SvgHelper
    def svg_tag(icon_name, options = {})
        file_path = File.read(Rails.root.join("app", "assets", "images", "#{icon_name}"))
        doc = Nokogiri::HTML::DocumentFragment.parse file_path
        svg = doc.at_css "svg"

        options.each { |attrs, value| svg[attrs.to_s] = value }

        doc.to_html.html_safe
    end
end
