# fixes https://github.com/solidusio-contrib/solidus_globalize/issues/18
# spree core should be updated to allow for more flexible search
#
# UPDATE...
# products sorting is important, so figure out how to keep that line and
# remove the rest

module Spree
  TaxonsController.class_eval do
    def show
      @taxon = Taxon.find_by!(permalink: params[:id])
      return unless @taxon

      @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
      @products = @searcher.retrieve_products.select('spree_products.*, spree_prices.amount').reorder('').send(:ascend_by_master_price)
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
