create table if not exists public.reservations (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  phone text not null,
  interest text not null,
  budget text not null,
  message text,
  created_at timestamptz default now()
);

alter table public.reservations enable row level security;

create policy "Allow anonymous inserts" on public.reservations
for insert to anon
with check (true);
