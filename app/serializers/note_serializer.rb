class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author_id
end
