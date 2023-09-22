CREATE TABLE public.produtos
(
    valor_unit real NOT NULL,
    quantidade integer NOT NULL,
    id_nf integer NOT NULL,
    id_item integer NOT NULL,
    cod_prod integer NOT NULL,
    desconto integer
);

ALTER TABLE public.produtos
    OWNER to postgres;


INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod)
	VALUES (15, 3, 5, 1, 3);
	
INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod)
	VALUES (30, 6, 5, 2, 5);
	
INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (23, 22, 6, 1, 1, 15);

INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (15, 25, 6, 2, 3, 20);

INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (25, 10, 7, 1, 1, 3);
	
INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (13.5, 10, 7, 2, 2, 4);
	
INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (15, 10, 7, 3, 3, 4);
	
INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (30, 10, 7, 4, 5, 1);
	
select * from produtos

select id_nf, id_item, cod_prod, valor_unit from produtos where desconto is null;

select id_nf, id_item, cod_prod, valor_unit, 
	    valor_unit - (valor_unit * desconto/100) as valor_vendido
from produtos
where desconto is not null;

select id_nf, id_item, cod_prod, valor_unit,
		valor_unit - (valor_unit * desconto/100) as valor_vendido,
		quantidade * valor_unit as valor_total
from produtos;

select id_nf, sum(quantidade * valor_unit) as valor_total
from produtos
group by id_nf
order by valor_total desc;
