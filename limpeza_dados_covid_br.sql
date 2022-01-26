-- Criando nova tabela apenas com os valores para o Brasil
create table brasil_covid as
select location as pais, date as data, 
		total_cases as total_casos, new_cases as novos_casos, 
		total_deaths as total_mortes, new_deaths as novas_mortes, 
		total_vaccinations as total_vacinacao, people_vaccinated as pessoas_vacinadas, 
		people_fully_vaccinated as pessoas_totalmente_vacinadas
from covid_data
where location = "Brazil"
order by date desc


-- Tratamento 

create table brasil_covid_mes as
select pais, strftime("%m/%Y", data) as mes_ano, 
		max(total_casos) as total_casos, 
		sum(novos_casos) as novos_casos, 
		max(total_mortes) as total_mortes, 
		sum(novas_mortes) as novas_mortes, 
		max(total_vacinacao) as total_vacinacao, 
		max(pessoas_vacinadas) as pessoas_vacinadas, 
		max(pessoas_totalmente_vacinadas) as pessoas_totalmente_vacinadas
from brasil_covid
group by mes_ano, pais
order by pessoas_totalmente_vacinadas




