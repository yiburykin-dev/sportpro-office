create table if not exists public.sportpro_ads_records (
  workspace_id text not null,
  id text not null,
  record jsonb,
  deleted_at timestamptz,
  updated_at timestamptz not null default now(),
  primary key (workspace_id, id)
);

create index if not exists sportpro_ads_records_workspace_updated_idx
  on public.sportpro_ads_records (workspace_id, updated_at desc);

alter table public.sportpro_ads_records enable row level security;

drop policy if exists "sportpro ads anon read" on public.sportpro_ads_records;
drop policy if exists "sportpro ads anon insert" on public.sportpro_ads_records;
drop policy if exists "sportpro ads anon update" on public.sportpro_ads_records;

create policy "sportpro ads anon read"
  on public.sportpro_ads_records
  for select
  to anon
  using (true);

create policy "sportpro ads anon insert"
  on public.sportpro_ads_records
  for insert
  to anon
  with check (true);

create policy "sportpro ads anon update"
  on public.sportpro_ads_records
  for update
  to anon
  using (true)
  with check (true);

grant select, insert, update on public.sportpro_ads_records to anon;

create table if not exists public.sportpro_ads_funnel_records (
  workspace_id text not null,
  id text not null,
  record jsonb,
  deleted_at timestamptz,
  updated_at timestamptz not null default now(),
  primary key (workspace_id, id)
);

create index if not exists sportpro_ads_funnel_records_workspace_updated_idx
  on public.sportpro_ads_funnel_records (workspace_id, updated_at desc);

alter table public.sportpro_ads_funnel_records enable row level security;

drop policy if exists "sportpro ads funnel anon read" on public.sportpro_ads_funnel_records;
drop policy if exists "sportpro ads funnel anon insert" on public.sportpro_ads_funnel_records;
drop policy if exists "sportpro ads funnel anon update" on public.sportpro_ads_funnel_records;

create policy "sportpro ads funnel anon read"
  on public.sportpro_ads_funnel_records
  for select
  to anon
  using (true);

create policy "sportpro ads funnel anon insert"
  on public.sportpro_ads_funnel_records
  for insert
  to anon
  with check (true);

create policy "sportpro ads funnel anon update"
  on public.sportpro_ads_funnel_records
  for update
  to anon
  using (true)
  with check (true);

grant select, insert, update on public.sportpro_ads_funnel_records to anon;
