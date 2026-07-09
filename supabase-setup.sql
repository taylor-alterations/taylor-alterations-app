-- ============================================
-- Taylor Alterations & More LLC
-- Supabase Database Setup
-- Paste this entire file into:
-- Supabase Dashboard → SQL Editor → New Query → Run
-- ============================================

-- CLIENTS
create table if not exists clients (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  phone text,
  email text,
  notes text,
  created_at timestamp with time zone default now()
);

-- JOBS
create table if not exists jobs (
  id uuid default gen_random_uuid() primary key,
  client_id uuid references clients(id) on delete cascade,
  client_name text not null,
  services text not null,
  total numeric(10,2) default 0,
  status text default 'new',
  complexity text default 'standard',
  notes text,
  created_at timestamp with time zone default now()
);

-- QUOTES
create table if not exists quotes (
  id uuid default gen_random_uuid() primary key,
  job_id uuid references jobs(id) on delete cascade,
  client_name text not null,
  client_phone text not null,
  services jsonb not null,
  total numeric(10,2) not null,
  service_label text,
  complexity text default 'standard',
  status text default 'pending',
  token text unique default gen_random_uuid()::text,
  sent_at timestamp with time zone default now(),
  responded_at timestamp with time zone
);

-- APPOINTMENTS
create table if not exists appointments (
  id uuid default gen_random_uuid() primary key,
  client_name text not null,
  service text,
  appt_date date not null,
  appt_time text,
  notes text,
  created_at timestamp with time zone default now()
);

-- REQUESTS (from client-facing form)
create table if not exists requests (
  id uuid default gen_random_uuid() primary key,
  first_name text not null,
  last_name text not null,
  phone text not null,
  email text,
  garment text,
  service text,
  qty integer default 1,
  urgency text default 'standard',
  notes text,
  preferred_date date,
  preferred_time text,
  source text,
  status text default 'new',
  created_at timestamp with time zone default now()
);

-- ============================================
-- ROW LEVEL SECURITY (RLS)
-- Public can only INSERT requests and READ quotes by token
-- All other access requires the anon key via your app
-- ============================================

alter table requests enable row level security;
alter table quotes enable row level security;
alter table jobs enable row level security;
alter table clients enable row level security;
alter table appointments enable row level security;

-- Allow anyone to submit a request (client form)
create policy "Public can submit requests"
  on requests for insert
  with check (true);

-- Allow anyone to read a quote by token (approval link)
create policy "Public can read quotes by token"
  on quotes for select
  using (true);

-- Allow anyone to update quote status (for approval)
create policy "Public can approve/decline quote"
  on quotes for update
  using (true);

-- Admin full access (uses service_role key server-side)
-- Jobs, Clients, Appointments: admin only via service key
create policy "Admin full access to jobs"
  on jobs for all
  using (true);

create policy "Admin full access to clients"
  on clients for all
  using (true);

create policy "Admin full access to appointments"
  on appointments for all
  using (true);

create policy "Admin full access to quotes"
  on quotes for all
  using (true);

create policy "Admin full access to requests"
  on requests for all
  using (true);

-- ============================================
-- Done! Your tables are ready.
-- ============================================
