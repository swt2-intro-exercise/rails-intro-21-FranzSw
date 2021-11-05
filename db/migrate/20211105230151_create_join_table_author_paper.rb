class CreateJoinTableAuthorPaper < ActiveRecord::Migration[6.0]
  def change
    create_table :authors_papers, id: false do |t|
      t.belongs_to :author
      t.belongs_to :paper
    end
  end
end
