library(recollections)

sb <- recollections::stringBuilder()

push(sb, 'foo')
expect_equal(toString(sb), 'foo')
push(sb, 'bar')
expect_equal(toString(sb), 'foobar')

sb <- recollections::stringBuilder('foo')
expect_equal(toString(sb), 'foo')
push(sb, 'bar')
expect_equal(toString(sb), 'foobar')

sb <- recollections::stringBuilder('foo', 'bar')
expect_equal(toString(sb), 'foobar')
push(sb, 'baz')
expect_equal(toString(sb), 'foobarbaz')
