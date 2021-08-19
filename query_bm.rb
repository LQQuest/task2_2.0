require_relative 'query'

order = Query.new('my_database', 'order')
comment = Query.new('my_database', 'comment')
comment.hash_create('order_id')
order.type("id")

Benchmark.bm do |x|
  x.report("normal query ") { order.find_by('id', 1) }
  x.report("bsearch query") { order.bsearch_find_by('description', 'c3') }
  x.report(" hash query  ") { comment.find_by_hash(233) }
end
