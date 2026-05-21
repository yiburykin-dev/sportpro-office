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

create table if not exists public.sportpro_content_plan_items (
  workspace_id text not null,
  id text not null,
  record jsonb,
  deleted_at timestamptz,
  updated_at timestamptz not null default now(),
  primary key (workspace_id, id)
);

create index if not exists sportpro_content_plan_items_workspace_updated_idx
  on public.sportpro_content_plan_items (workspace_id, updated_at desc);

alter table public.sportpro_content_plan_items enable row level security;

drop policy if exists "sportpro content plan anon read" on public.sportpro_content_plan_items;
drop policy if exists "sportpro content plan anon insert" on public.sportpro_content_plan_items;
drop policy if exists "sportpro content plan anon update" on public.sportpro_content_plan_items;

create policy "sportpro content plan anon read"
  on public.sportpro_content_plan_items
  for select
  to anon
  using (true);

create policy "sportpro content plan anon insert"
  on public.sportpro_content_plan_items
  for insert
  to anon
  with check (true);

create policy "sportpro content plan anon update"
  on public.sportpro_content_plan_items
  for update
  to anon
  using (true)
  with check (true);

grant select, insert, update on public.sportpro_content_plan_items to anon;

create table if not exists public.sportpro_content_ideas (
  workspace_id text not null,
  id text not null,
  record jsonb,
  deleted_at timestamptz,
  updated_at timestamptz not null default now(),
  primary key (workspace_id, id)
);

create index if not exists sportpro_content_ideas_workspace_updated_idx
  on public.sportpro_content_ideas (workspace_id, updated_at desc);

alter table public.sportpro_content_ideas enable row level security;

drop policy if exists "sportpro content ideas anon read" on public.sportpro_content_ideas;
drop policy if exists "sportpro content ideas anon insert" on public.sportpro_content_ideas;
drop policy if exists "sportpro content ideas anon update" on public.sportpro_content_ideas;

create policy "sportpro content ideas anon read"
  on public.sportpro_content_ideas
  for select
  to anon
  using (true);

create policy "sportpro content ideas anon insert"
  on public.sportpro_content_ideas
  for insert
  to anon
  with check (true);

create policy "sportpro content ideas anon update"
  on public.sportpro_content_ideas
  for update
  to anon
  using (true)
  with check (true);

grant select, insert, update on public.sportpro_content_ideas to anon;

create table if not exists public.sportpro_sales_clients (
  workspace_id text not null,
  id text not null,
  record jsonb,
  deleted_at timestamptz,
  updated_at timestamptz not null default now(),
  primary key (workspace_id, id)
);

create index if not exists sportpro_sales_clients_workspace_updated_idx
  on public.sportpro_sales_clients (workspace_id, updated_at desc);

alter table public.sportpro_sales_clients enable row level security;

drop policy if exists "sportpro sales clients anon read" on public.sportpro_sales_clients;
drop policy if exists "sportpro sales clients anon insert" on public.sportpro_sales_clients;
drop policy if exists "sportpro sales clients anon update" on public.sportpro_sales_clients;

create policy "sportpro sales clients anon read"
  on public.sportpro_sales_clients
  for select
  to anon
  using (true);

create policy "sportpro sales clients anon insert"
  on public.sportpro_sales_clients
  for insert
  to anon
  with check (true);

create policy "sportpro sales clients anon update"
  on public.sportpro_sales_clients
  for update
  to anon
  using (true)
  with check (true);

grant select, insert, update on public.sportpro_sales_clients to anon;

create table if not exists public.sportpro_sales_settings (
  workspace_id text not null,
  id text not null,
  record jsonb,
  deleted_at timestamptz,
  updated_at timestamptz not null default now(),
  primary key (workspace_id, id)
);

create index if not exists sportpro_sales_settings_workspace_updated_idx
  on public.sportpro_sales_settings (workspace_id, updated_at desc);

alter table public.sportpro_sales_settings enable row level security;

drop policy if exists "sportpro sales settings anon read" on public.sportpro_sales_settings;
drop policy if exists "sportpro sales settings anon insert" on public.sportpro_sales_settings;
drop policy if exists "sportpro sales settings anon update" on public.sportpro_sales_settings;

create policy "sportpro sales settings anon read"
  on public.sportpro_sales_settings
  for select
  to anon
  using (true);

create policy "sportpro sales settings anon insert"
  on public.sportpro_sales_settings
  for insert
  to anon
  with check (true);

create policy "sportpro sales settings anon update"
  on public.sportpro_sales_settings
  for update
  to anon
  using (true)
  with check (true);

grant select, insert, update on public.sportpro_sales_settings to anon;
