-- ============================================
-- DEMO DE SEGURIDAD - CLASE DE REDES
-- Base de datos: tienda online "ShopMex"
-- ============================================

-- Usuarios con datos personales sensibles
CREATE TABLE usuarios (
  id            SERIAL PRIMARY KEY,
  nombre        VARCHAR(100),
  email         VARCHAR(100),
  password_hash VARCHAR(255),
  telefono      VARCHAR(20),
  fecha_nac     DATE,
  direccion     VARCHAR(255),
  ciudad        VARCHAR(50),
  creado_en     TIMESTAMP DEFAULT NOW()
);

-- Tarjetas de crédito vinculadas
CREATE TABLE tarjetas (
  id          SERIAL PRIMARY KEY,
  usuario_id  INT REFERENCES usuarios(id),
  titular     VARCHAR(100),
  numero      VARCHAR(19),
  cvv         VARCHAR(4),
  expiracion  VARCHAR(7),
  tipo        VARCHAR(10)
);

-- Órdenes de compra
CREATE TABLE ordenes (
  id          SERIAL PRIMARY KEY,
  usuario_id  INT REFERENCES usuarios(id),
  total       DECIMAL(10,2),
  estado      VARCHAR(20),
  creado_en   TIMESTAMP DEFAULT NOW()
);

-- Tokens de sesión activos
CREATE TABLE sesiones (
  id          SERIAL PRIMARY KEY,
  usuario_id  INT REFERENCES usuarios(id),
  token       VARCHAR(255),
  ip_origen   VARCHAR(45),
  expira_en   TIMESTAMP
);

-- ============================================
-- DATOS
-- ============================================

INSERT INTO usuarios (id, nombre, email, password_hash, telefono, fecha_nac, direccion, ciudad) VALUES
  (1,  'Carlos Mendoza',     'cmendoza@gmail.com',      'md5:5f4dcc3b5aa765d61d8327deb882cf99', '55-1234-5678', '1990-03-14', 'Av. Insurgentes Sur 1602, Piso 3', 'CDMX'),
  (2,  'Sofía Ramírez',      'sofia.ramirez@hotmail.com','md5:482c811da5d5b4bc6d497ffa98491e38', '55-9876-5432', '1995-07-22', 'Calle Madero 45, Col. Centro',     'Guadalajara'),
  (3,  'Diego Torres',       'diegot@empresa.com.mx',   'md5:d8578edf8458ce06fbc5bb76a58c5ca4', '33-4567-8901', '1988-11-05', 'Blvd. Agua Caliente 2080',         'Tijuana'),
  (4,  'Valentina Cruz',     'vcruz@outlook.com',       'md5:827ccb0eea8a706c4c34a16891f84e7b', '81-2345-6789', '1993-01-30', 'Av. Constitución 300, Depto 12',   'Monterrey'),
  (5,  'Andrés Gutiérrez',   'andres.g@yahoo.com',      'md5:e10adc3949ba59abbe56e057f20f883e', '55-6543-2109', '1985-09-18', 'Periférico Sur 4829',              'CDMX'),
  (6,  'Fernanda Jiménez',   'ferji@gmail.com',         'md5:25f9e794323b453885f5181f1b624d0b', '222-345-6789', '1997-04-12', 'Calle 5 de Mayo 123',              'Puebla'),
  (7,  'Roberto Sánchez',    'rsanchez@protonmail.com', 'md5:5ebe2294ecd0e0f08eab7690d2a6ee69', '998-123-4567', '1991-08-25', 'Av. Tulum km 3.5, Local 8',        'Cancún'),
  (8,  'Mariana Flores',     'mflores@live.com',        'md5:f25a2fc72690b780b2a14e140ef6a9e0', '55-7890-1234', '1989-12-03', 'Insurgentes Norte 900',            'CDMX');

INSERT INTO tarjetas (usuario_id, titular, numero, cvv, expiracion, tipo) VALUES
  (1, 'CARLOS MENDOZA',     '4532 1234 5678 9010', '742', '08/26', 'VISA'),
  (1, 'CARLOS MENDOZA',     '5412 9876 5432 1098', '391', '11/25', 'MASTERCARD'),
  (2, 'SOFIA RAMIREZ',      '4916 3344 5566 7788', '214', '03/27', 'VISA'),
  (3, 'DIEGO TORRES',       '3714 496353 98431',   '1089','07/26', 'AMEX'),
  (4, 'VALENTINA CRUZ',     '5500 0055 5555 5559', '876', '01/26', 'MASTERCARD'),
  (5, 'ANDRES GUTIERREZ',   '4111 1111 1111 1111', '953', '09/25', 'VISA'),
  (6, 'FERNANDA JIMENEZ',   '4222 2222 2222 2222', '428', '06/27', 'VISA'),
  (7, 'ROBERTO SANCHEZ',    '5105 1051 0510 5100', '637', '12/25', 'MASTERCARD'),
  (8, 'MARIANA FLORES',     '4012 8888 8888 1881', '519', '04/26', 'VISA');

INSERT INTO ordenes (usuario_id, total, estado) VALUES
  (1, 2499.00, 'entregado'),
  (1, 899.50,  'en camino'),
  (2, 15600.00,'entregado'),
  (3, 450.00,  'entregado'),
  (4, 3200.00, 'procesando'),
  (5, 780.00,  'entregado'),
  (6, 12000.00,'en camino'),
  (7, 599.99,  'entregado'),
  (8, 4500.00, 'procesando');

INSERT INTO sesiones (usuario_id, token, ip_origen, expira_en) VALUES
  (1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxfQ.abc123', '187.190.45.23',  NOW() + INTERVAL '2 hours'),
  (2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyfQ.def456', '201.122.87.65',  NOW() + INTERVAL '1 hour'),
  (4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0fQ.ghi789', '148.243.12.90',  NOW() + INTERVAL '3 hours'),
  (7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo3fQ.jkl012', '200.68.134.201', NOW() + INTERVAL '30 minutes');