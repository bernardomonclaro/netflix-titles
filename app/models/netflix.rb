class Netflix < ApplicationRecord
  # Evita o cadastro de registros duplicados baseado no atributo 'title'
  validates :show_id, uniqueness: true

  scope :filter_by_year, ->(year) { where release_year: year }
  scope :filter_by_genre, ->(genre) { where show_type: genre }
  scope :filter_by_country, ->(country) { where country: country }

  # Kaminari
  paginates_per 10

  # Parse do atributo 'date_added'
  def as_json(options = {})
    super(options)
    if date_added
      time = Time.parse(date_added)
      time_convert = time.strftime('%Y-%d-%m')
    else
      time_convert = date_added
    end
    # Troca os nomes dos atributos para aparecerem da forma pedida na response
    # 'show_type' => 'genre', 'release_year' => 'year' e 'date_added' => 'published_at'
    {
      id: id,
      title: title,
      genre: show_type,
      year: release_year,
      country: country,
      published_at: time_convert,
      description: description
    }
  end
end
