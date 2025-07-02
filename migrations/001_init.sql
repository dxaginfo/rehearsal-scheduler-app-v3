CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE NOT NULL,
  role VARCHAR(30),
  password_hash TEXT
);

CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  owner_id INTEGER REFERENCES users(id),
  member_ids INTEGER[]
);

CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  group_id INTEGER REFERENCES groups(id),
  date_time TIMESTAMP,
  location VARCHAR(200),
  notes TEXT,
  sheet_links TEXT[]
);

CREATE TABLE attendance (
  id SERIAL PRIMARY KEY,
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  user_id INTEGER REFERENCES users(id),
  status VARCHAR(20)
);

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  group_id INTEGER REFERENCES groups(id),
  user_id INTEGER REFERENCES users(id),
  amount NUMERIC,
  status VARCHAR(20),
  timestamp TIMESTAMP
);

CREATE TABLE invites (
  id SERIAL PRIMARY KEY,
  group_id INTEGER REFERENCES groups(id),
  email VARCHAR(100),
  status VARCHAR(20),
  token VARCHAR(100),
  sent_at TIMESTAMP
);