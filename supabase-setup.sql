create table if not exists public.sportpro_workspace_members (
  workspace_id text not null,
  user_id uuid not null references auth.users(id) on delete cascade,
  role text not null default 'member',
  created_at timestamptz not null default now(),
  primary key (workspace_id, user_id)
);

alter table public.sportpro_workspace_members enable row level security;

drop policy if exists "sportpro workspace members own read" on public.sportpro_workspace_members;

create policy "sportpro workspace members own read"
  on public.sportpro_workspace_members
  for select
  to authenticated
  using (user_id = auth.uid());

revoke all on public.sportpro_workspace_members from anon;
grant select on public.sportpro_workspace_members to authenticated;

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
drop policy if exists "sportpro ads member read" on public.sportpro_ads_records;
drop policy if exists "sportpro ads member insert" on public.sportpro_ads_records;
drop policy if exists "sportpro ads member update" on public.sportpro_ads_records;

create policy "sportpro ads member read"
  on public.sportpro_ads_records
  for select
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_ads_records.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro ads member insert"
  on public.sportpro_ads_records
  for insert
  to authenticated
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_ads_records.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro ads member update"
  on public.sportpro_ads_records
  for update
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_ads_records.workspace_id
      and member.user_id = auth.uid()
  ))
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_ads_records.workspace_id
      and member.user_id = auth.uid()
  ));

revoke all on public.sportpro_ads_records from anon;
grant select, insert, update on public.sportpro_ads_records to authenticated;

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
drop policy if exists "sportpro ads funnel member read" on public.sportpro_ads_funnel_records;
drop policy if exists "sportpro ads funnel member insert" on public.sportpro_ads_funnel_records;
drop policy if exists "sportpro ads funnel member update" on public.sportpro_ads_funnel_records;

create policy "sportpro ads funnel member read"
  on public.sportpro_ads_funnel_records
  for select
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_ads_funnel_records.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro ads funnel member insert"
  on public.sportpro_ads_funnel_records
  for insert
  to authenticated
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_ads_funnel_records.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro ads funnel member update"
  on public.sportpro_ads_funnel_records
  for update
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_ads_funnel_records.workspace_id
      and member.user_id = auth.uid()
  ))
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_ads_funnel_records.workspace_id
      and member.user_id = auth.uid()
  ));

revoke all on public.sportpro_ads_funnel_records from anon;
grant select, insert, update on public.sportpro_ads_funnel_records to authenticated;

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
drop policy if exists "sportpro content plan member read" on public.sportpro_content_plan_items;
drop policy if exists "sportpro content plan member insert" on public.sportpro_content_plan_items;
drop policy if exists "sportpro content plan member update" on public.sportpro_content_plan_items;

create policy "sportpro content plan member read"
  on public.sportpro_content_plan_items
  for select
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_content_plan_items.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro content plan member insert"
  on public.sportpro_content_plan_items
  for insert
  to authenticated
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_content_plan_items.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro content plan member update"
  on public.sportpro_content_plan_items
  for update
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_content_plan_items.workspace_id
      and member.user_id = auth.uid()
  ))
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_content_plan_items.workspace_id
      and member.user_id = auth.uid()
  ));

revoke all on public.sportpro_content_plan_items from anon;
grant select, insert, update on public.sportpro_content_plan_items to authenticated;

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
drop policy if exists "sportpro content ideas member read" on public.sportpro_content_ideas;
drop policy if exists "sportpro content ideas member insert" on public.sportpro_content_ideas;
drop policy if exists "sportpro content ideas member update" on public.sportpro_content_ideas;

create policy "sportpro content ideas member read"
  on public.sportpro_content_ideas
  for select
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_content_ideas.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro content ideas member insert"
  on public.sportpro_content_ideas
  for insert
  to authenticated
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_content_ideas.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro content ideas member update"
  on public.sportpro_content_ideas
  for update
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_content_ideas.workspace_id
      and member.user_id = auth.uid()
  ))
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_content_ideas.workspace_id
      and member.user_id = auth.uid()
  ));

revoke all on public.sportpro_content_ideas from anon;
grant select, insert, update on public.sportpro_content_ideas to authenticated;

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
drop policy if exists "sportpro sales clients member read" on public.sportpro_sales_clients;
drop policy if exists "sportpro sales clients member insert" on public.sportpro_sales_clients;
drop policy if exists "sportpro sales clients member update" on public.sportpro_sales_clients;

create policy "sportpro sales clients member read"
  on public.sportpro_sales_clients
  for select
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_sales_clients.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro sales clients member insert"
  on public.sportpro_sales_clients
  for insert
  to authenticated
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_sales_clients.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro sales clients member update"
  on public.sportpro_sales_clients
  for update
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_sales_clients.workspace_id
      and member.user_id = auth.uid()
  ))
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_sales_clients.workspace_id
      and member.user_id = auth.uid()
  ));

revoke all on public.sportpro_sales_clients from anon;
grant select, insert, update on public.sportpro_sales_clients to authenticated;

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
drop policy if exists "sportpro sales settings member read" on public.sportpro_sales_settings;
drop policy if exists "sportpro sales settings member insert" on public.sportpro_sales_settings;
drop policy if exists "sportpro sales settings member update" on public.sportpro_sales_settings;

create policy "sportpro sales settings member read"
  on public.sportpro_sales_settings
  for select
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_sales_settings.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro sales settings member insert"
  on public.sportpro_sales_settings
  for insert
  to authenticated
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_sales_settings.workspace_id
      and member.user_id = auth.uid()
  ));

create policy "sportpro sales settings member update"
  on public.sportpro_sales_settings
  for update
  to authenticated
  using (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_sales_settings.workspace_id
      and member.user_id = auth.uid()
  ))
  with check (exists (
    select 1 from public.sportpro_workspace_members member
    where member.workspace_id = sportpro_sales_settings.workspace_id
      and member.user_id = auth.uid()
  ));

revoke all on public.sportpro_sales_settings from anon;
grant select, insert, update on public.sportpro_sales_settings to authenticated;

-- After creating users in Supabase Auth, add each allowed user to a workspace:
-- insert into public.sportpro_workspace_members (workspace_id, user_id, role)
-- select 'sportpro-main', id, 'owner'
-- from auth.users
-- where email = 'your-email@example.com'
-- on conflict (workspace_id, user_id) do update set role = excluded.role;
