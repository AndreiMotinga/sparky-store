# NOTE
# this code is copied as is from solidus frontend
# in order to be able to use spree_application for static pages
module SpreeHelper
  def drawer_taxons_tree(root_taxon, current_taxon, max_level = 5)
    return "" if max_level < 1 || root_taxon.children.empty?
    taxons = root_taxon.children.map do |taxon|
      content_tag(:li, link_to(taxon.name, seo_url(taxon), class: "mdl-navigation__link")) +
        drawer_taxons_tree(taxon, current_taxon, max_level - 1)
    end
    safe_join(taxons, "\n")
  end

  def seo_url(taxon)
    spree.nested_taxons_path(taxon.permalink)
  end
end
