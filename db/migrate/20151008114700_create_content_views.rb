class CreateContentViews < ActiveRecord::Migration
  def up
    execute("
      CREATE OR REPLACE VIEW content_views AS
        SELECT id, title,     'Post' AS type,   body, author, NULL AS start_time, NULL AS surname, NULL AS city, created_at, updated_at, tag_ids FROM posts
        UNION
        SELECT id, title,     'Event' AS type,  body, author, start_time,         NULL ,           city,         created_at, updated_at, tag_ids FROM events
        UNION
        SELECT id, username,  'User' AS type,   NULL, NULL,   NULL,               surname,         city,         created_at, updated_at, tag_ids FROM users
      ")
  end

  def down
    execute("DROP VIEW content_views;")
  end
end
