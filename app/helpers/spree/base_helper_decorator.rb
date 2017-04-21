module Spree
  module BaseHelper
    def logo(classes = "", image_path = Spree::Config[:logo])
      link_to image_tag(image_path, class: classes), spree.root_path
    end

    def taxons_tree(root_taxon, current_taxon, max_level = 1)
      return '' if max_level < 1 || root_taxon.children.empty?
      taxons = root_taxon.children.map do |taxon|
        link_to(taxon.name, seo_url(taxon), class: "mdl-navigation__link") +
          taxons_tree(taxon, current_taxon, max_level - 1)
      end
      safe_join(taxons, "\n")
    end
  end
end
