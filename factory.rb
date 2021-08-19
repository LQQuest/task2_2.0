def create_content
  order_file = CSV.open('my_database/order.csv', 'a')
  order_file << [1, 1345, 'a1', Time.new.strftime("%d/%m/%Y")]
  order_file << [2, 2342, 'b2', Time.new.strftime("%d/%m/%Y")]
  order_file << [3, 3412, 'c3', Time.new.strftime("%d/%m/%Y")]
  order_file << [4, 1244, 'd4', Time.new.strftime("%d/%m/%Y")]
  order_file << [5, 5879, 'e5', Time.new.strftime("%d/%m/%Y")]
  order_file << [6, 6567, 'f6', Time.new.strftime("%d/%m/%Y")]

  comment_file = CSV.open('my_database/comment.csv', 'a')
  comment_file << [1, 1123, 'a1']
  comment_file << [2, 2768, 'b2']
  comment_file << [3, 3967, 'c3']
  comment_file << [4, 4345, 'd4']
  comment_file << [5, 5234, 'e5']
  comment_file << [6, 6866, 'f6']

end