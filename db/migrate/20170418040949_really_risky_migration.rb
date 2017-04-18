class ReallyRiskyMigration < ActiveRecord::Migration[5.0]
  disable_ddl_transaction!

  def change
    add_column :posts, :published, :boolean, default: true
    add_index :posts, :title, unique: true
    add_column :posts, :published_at, :timestamp
    Post.all.each do |post|
      post.update! published_at: Time.now
    end
  end
end
