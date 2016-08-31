class CreateMessageHierarchies < ActiveRecord::Migration
  def change
    create_table :message_hierarchies, :id => false do |t|
      t.integer  :ancestor_id, :null => false   # ID of the parent/grandparent/great-grandparent/... comments
      t.integer  :descendant_id, :null => false # ID of the target comment
      t.integer  :generations, :null => false   # Number of generations between the ancestor and the descendant. Parent/child = 1, for example.
    end

    # For "all progeny of…" and leaf selects:
    add_index :message_hierarchies, [:ancestor_id, :descendant_id, :generations],
              :unique => true, :name => "message_anc_desc_udx"

    # For "all ancestors of…" selects,
    add_index :message_hierarchies, [:descendant_id],
              :name => "message_desc_idx"
  end
end
