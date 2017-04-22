module Spree
  module BaseHelper
    def logo(classes = "", image_path = Spree::Config[:logo])
      link_to image_tag(image_path, class: classes), spree.root_path
    end

    def taxons_tree(root_taxon, current_taxon, max_level = 1)
      return "" if max_level < 1 || root_taxon.children.empty?
      taxons = root_taxon.children.map do |taxon|
        link_to(taxon.name, seo_url(taxon), class: "mdl-navigation__link") +
          taxons_tree(taxon, current_taxon, max_level - 1)
      end
      safe_join(taxons, "\n")
    end

    # NOTE: solidus frontend takes presedence over flutie body_class
    def body_class(options = {})
      extra_body_classes_symbol = options[:extra_body_classes_symbol] || :extra_body_classes
      qualified_controller_name = controller.controller_path.gsub("/", "-")
      basic_body_class = "#{qualified_controller_name} #{qualified_controller_name}-#{controller.action_name}"

      if content_for?(extra_body_classes_symbol)
        [basic_body_class, content_for(extra_body_classes_symbol)].join(" ")
      else
        basic_body_class
      end
    end
  end
end
