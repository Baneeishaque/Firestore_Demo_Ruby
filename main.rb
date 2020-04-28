# frozen_string_literal: true

require 'google/cloud/firestore'

firestore = Google::Cloud::Firestore.new project_id: 'firestore-demo-ruby', keyfile: 'firestore-demo-ruby-e1cbef86b597.json'
puts 'Created Cloud Firestore client with given project ID.'

def view_users(firestore)
  users_ref = firestore.col 'users'
  users_ref.get do |user|
    puts "#{user.document_id} data: #{user.data}."
  end
end

view_users(firestore)

doc_ref = firestore.doc 'users/baneeishaque'
doc_ref.set(
    first: 'Banee',
    last: 'Ishaque',
    born: 1993
)
puts 'Added data to the baneeishaque document in the users collection.'

doc_ref = firestore.doc 'users/aturing'
doc_ref.set(
    first: 'Alan',
    middle: 'Mathison',
    last: 'Turing',
    born: 1912
)
puts 'Added data to the aturing document in the users collection.'

view_users(firestore)

