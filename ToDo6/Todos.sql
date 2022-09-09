CREATE TABLE "relatorio" (
  "id_relatorio" int PRIMARY KEY,
	"data_relatorio" date,
	"id_empresa" int,
	"id_tecnologia" int
 	
);

CREATE TABLE "empresa" (
  "id_empresa" int PRIMARY KEY,
	"nome" varchar(100),
	"id_tecnologia" int

);
CREATE TABLE "tecnologia" (
  "id_tecnologia" int PRIMARY KEY,
	"nome" varchar(100),
	"area" varchar(100)
);


insert into empresa values 
(	1	,	'CONOGRAMA',1)	,
(	2	,	'DATA LAKE',2)	,
(	3	,	'JURIS'	,3);

insert into tecnologia values 
(	1	,	'AI', 'DADOS')	,
(	2	,	'HiperautomaÃ§Ã£o', 'AUTOMACAO'),
(	3	,	'Blockchain', 'DADOS'	),
(	4	,	'ImpressÃ£o 3D', 'AUTOMACAO')	,
(	5	,	'Internet das Coisas', 'DADOS')	;

select * from empresa
UPDATE relatorio
ALTER TABLE relatorio add column id_empresa int;
ALTER TABLE relatorio add column id_tecnologia int;

alter table relatorio add foreign key (id_empresa) references empresa (id_empresa);
alter table relatorio add foreign key (id_tecnologia) references tecnologia (id_tecnologia);

SELECT * From relatorio ;
insert into relatorio VALUES
(1, '20/7/2021',1,2),
(2, '20/7/2021',1,3),
(3, '20/7/2021',2,1);


alter TABLE relatorio alter COLUMN id_empresa ty
--Consultas
--Qual empresa utiliza o maior nÃºmero de tecnologias na Ãºltima pesquisa (1/2022)?
select * from relatorio;
--Qual empresa utilizava o menor nÃºmero de tecnologias na pesquisa anterior (2/2021)?
--Quantas empresas utilizam tecnologias da Ã¡rea de â€œDadosâ€ atualmente?
select empresa.nome, count(tecnologia.id_tecnologia) 
as area from tecnologia
    inner join empresa
        on empresa.id_tecnologia = tecnologia.id_tecnologia
where area = 'DADOS' 
group by empresa.nome
    
--Quantas empresas utilizam tecnologias que nÃ£o sÃ£o da Ã¡rea de â€œDadosâ€ atualmente?
select empresa.nome, count(empresa.id_tecnologia) 
as area from tecnologia
    inner join empresa
        on empresa.id_tecnologia = tecnologia.id_tecnologia
where area <> 'DADOS' 
group by empresa.nome
