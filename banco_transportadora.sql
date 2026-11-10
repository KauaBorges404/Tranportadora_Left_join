-- Banco da transportadora
CREATE DATABASE transportadora_left;
USE transportadora_left;
 
-- Motoristas (cnh = categoria da habilitação)
CREATE TABLE motorista (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  cnh VARCHAR(2) NOT NULL,
  cidade_base VARCHAR(40) NOT NULL
);
 
-- Entregas: motorista_id aponta para motorista(id)
CREATE TABLE entrega (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(10) NOT NULL UNIQUE,
  destino VARCHAR(40) NOT NULL,
  peso_kg DECIMAL(7,2) NOT NULL,
  status VARCHAR(15) NOT NULL,
  motorista_id INT NOT NULL,
  FOREIGN KEY (motorista_id) REFERENCES motorista(id)
);
 
INSERT INTO motorista (nome, cnh, cidade_base) VALUES
  ('Roberto Nunes', 'C', 'Campinas'),
  ('Luana Ferraz', 'E', 'São Paulo'),
  ('André Batista', 'D', 'Sorocaba'),
  ('Sérgio Mota', 'C', 'São Paulo'),
  ('Kátia Ramos', 'E', 'Campinas');
 
INSERT INTO entrega (codigo, destino, peso_kg, status, motorista_id) VALUES
  ('ENT-001', 'Santos', 1200.00, 'Entregue', 2),
  ('ENT-002', 'Jundiaí', 350.50, 'Entregue', 1),
  ('ENT-003', 'Ribeirão Preto', 8000.00, 'Em rota', 2),
  ('ENT-004', 'Piracicaba', 420.00, 'Entregue', 1),
  ('ENT-005', 'Bauru', 2500.00, 'Em rota', 3),
  ('ENT-006', 'Santos', 980.00, 'Pendente', 2),
  ('ENT-007', 'Sorocaba', 150.00, 'Entregue', 3),
  ('ENT-008', 'Campinas', 600.00, 'Pendente', 1);

-- Mostre todos os motoristas com os seus entregas, incluindo quem não tem nenhum. Comece o FROM pela tabela motorista. Quantas linhas saíram?
select motorista.nome, entrega.destino
from motorista
left join entrega
on entrega.motorista_id = motorista.id;

-- Rode a mesma consulta trocando LEFT JOIN por INNER JOIN. Quantas linhas saíram agora? 
select motorista.nome, entrega.destino
from motorista
inner join entrega
on entrega.motorista_id = motorista.id;

-- Quais motoristas não têm nenhuma entrega?
select motorista.nome, entrega.id
from motorista
left join entrega
on entrega.motorista_id = motorista.id
where entrega.destino is null;

-- Quantas entregas cada motorista tem, incluindo quem tem zero?
select motorista.nome, count(entrega.id) as total
from motorista
left join entrega 
on entrega.motorista_id = motorista.id
group by motorista.nome;

-- Mostre os motoristas com habilitação categoria E com as suas entregas, incluindo quem não tem entrega
select motorista.nome,motorista.cnh, entrega.destino
from motorista
left join entrega
on entrega.motorista_id = motorista.id
where motorista.cnh = 'E';
where motorista.cnh = 'E';


