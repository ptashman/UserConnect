module SitesHelper
  def create_trade_items(site, trade_items)
    trade_items.split(",").each do |item|
      TradeItem.create(site_id: site.id, name: item)
    end
  end
end
