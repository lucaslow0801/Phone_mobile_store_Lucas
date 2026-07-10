create table if not exists public.reservations (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  phone text,
  interest text,
  budget text,
  message text,
  contact_number text,
  brand text,
  model text,
  created_at timestamptz default now()
);

alter table public.reservations add column if not exists contact_number text;
alter table public.reservations add column if not exists brand text;
alter table public.reservations add column if not exists model text;

alter table public.reservations alter column phone drop not null;
alter table public.reservations alter column interest drop not null;
alter table public.reservations alter column budget drop not null;

alter table public.reservations enable row level security;

create policy "Allow anonymous inserts" on public.reservations
for insert to anon
with check (true);
