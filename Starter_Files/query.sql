

CREATE VIEW card_holder_transactions as
SELECT cardH.card_holder_name, creditC.card_number_id, trans.date, trans.amount, merch.merchant_name, merchC.merchant_category_name
FROM transaction as trans
JOIN credit_card as creditC on creditC.card_number_id = trans.card_number_id
JOIN card_holder as cardH on cardH.card_holder_id = creditC.card_holder_id
JOIN merchant as merch on merch.merchant_id = trans.merchant_id
JOIN merchant_category as merchC on merchC.merchant_category_id = merch.merchant_category_id
ORDER BY cardH.card_holder_name;


Select * 
from transaction as trans 
where date_part('hour', trans.date)>= 7 and date_part('hour', trans.date) <= 9
order by amount DESC
LIMIT 100;

select count(trans.amount)
from transaction as trans
where trans.amount <=2;

select *
from transaction as trans
where trans.amount <=2
order by trans.card_number_id, trans.amount DESC;

select  mer.merchant_name, merCat.merchant_category_name
from transaction as trans
join merchant as mer on mer.merchant_id = trans.merchant_id
join merchant_category as merCat on merCat.merchant_category_id = mer.merchant_category_id
where trans.amount <2
Group by merCat.merchant_category_name, mer.merchant_name
order by count(trans.amount) DESC
Limit 5;



