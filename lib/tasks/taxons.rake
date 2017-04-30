namespace :taxons do
  task generate: :environment do
    names = [
      "Дрели",
      "Шуруповерты сетевые",
      "Миксеры",
      "Аккумуляторные инструменты",
      "Перфораторы и отбойные молотки",
      "Угловые шлифмашины",
      "Шлифмашины для бетона",
      "Штроборезы",
      "Точила",
      "Прямые шлифовальные машины",
      "Фрезеры",
      "Лобзики",
      "Сабельные пилы",
      "Дисковые и торцовочные пилы",
      "Рубанки",
      "Фены промышленные",
      "Пылесосы для влажной и сухой очистки",
      "Ножницы по металлу",
      "Специализированные инструменты",
      "Шлифовальные и полировальные машины",
      "Аксессуары",
      "Цепные пилы"
    ]

    names.each do |name|
      taxon = Spree::Taxon.find_by_name name
      taxonomy = Spree::Taxonomy.find_or_create_by(
        name: taxon.name,
        position: taxon.position
      )
      taxon.children.each { |child| taxonomy.root.children << child }
      taxon.products.each { |product| taxonomy.root.products << product }
    end
  end
end
