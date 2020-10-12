defmodule   P i n g e r   do
d e f   s t a r t _ l i n k ( )   do
Task . s t a r t _ l i n k ( f n−>  l o o p ( )   end )
end
d e f p   l o o p ( o u t p u t _ p i n g   \ \   f a l s e )   do
r e c e i v e   do
{ : p i n g }−>
i f   o u t p u t _ p i n g   do
IO . p u t s ( " p i n g " )
e l s e
IO . p u t s ( " pong " )
end
l o o p ( ! o u t p u t _ p i n g )
end
end
end