class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author_id

  belongs_to :author
end
