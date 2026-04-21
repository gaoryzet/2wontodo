create table if not exists app_users (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text not null,
  profile_color text not null default '#176d6b',
  created_at timestamptz not null default now()
);

create table if not exists projects (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  client_name text not null,
  color text not null default '#176d6b',
  type text not null check (type in ('single', 'complex')),
  category text not null check (category in ('illustration', 'branding', 'order', 'etc')),
  start_date date not null,
  end_date date not null,
  status text not null default 'pending' check (status in ('pending', 'completed')),
  created_at timestamptz not null default now()
);

create table if not exists schedules (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references projects(id) on delete cascade,
  phase text not null,
  title text not null,
  client_name text not null,
  content text default '',
  start_date date not null,
  end_date date not null,
  category text not null check (category in ('illustration', 'branding', 'order', 'etc')),
  status text not null default 'pending' check (status in ('pending', 'completed')),
  assignee_user_id uuid references app_users(id) on delete set null,
  created_at timestamptz not null default now()
);

alter table app_users enable row level security;
alter table projects enable row level security;
alter table schedules enable row level security;

drop policy if exists "public read app_users" on app_users;
drop policy if exists "public insert app_users" on app_users;
drop policy if exists "public update app_users" on app_users;
drop policy if exists "public delete app_users" on app_users;
drop policy if exists "owner read app_users" on app_users;
drop policy if exists "owner insert app_users" on app_users;
drop policy if exists "owner update app_users" on app_users;
drop policy if exists "owner delete app_users" on app_users;

drop policy if exists "public read projects" on projects;
drop policy if exists "public insert projects" on projects;
drop policy if exists "public update projects" on projects;
drop policy if exists "public delete projects" on projects;
drop policy if exists "owner read projects" on projects;
drop policy if exists "owner insert projects" on projects;
drop policy if exists "owner update projects" on projects;
drop policy if exists "owner delete projects" on projects;

drop policy if exists "public read schedules" on schedules;
drop policy if exists "public insert schedules" on schedules;
drop policy if exists "public update schedules" on schedules;
drop policy if exists "public delete schedules" on schedules;
drop policy if exists "owner read schedules" on schedules;
drop policy if exists "owner insert schedules" on schedules;
drop policy if exists "owner update schedules" on schedules;
drop policy if exists "owner delete schedules" on schedules;

create policy "owner read app_users" on app_users for select to authenticated using (auth.jwt() ->> 'email' = 'zzummm@naver.com');
create policy "owner insert app_users" on app_users for insert to authenticated with check (auth.jwt() ->> 'email' = 'zzummm@naver.com');
create policy "owner update app_users" on app_users for update to authenticated using (auth.jwt() ->> 'email' = 'zzummm@naver.com') with check (auth.jwt() ->> 'email' = 'zzummm@naver.com');
create policy "owner delete app_users" on app_users for delete to authenticated using (auth.jwt() ->> 'email' = 'zzummm@naver.com');

create policy "owner read projects" on projects for select to authenticated using (auth.jwt() ->> 'email' = 'zzummm@naver.com');
create policy "owner insert projects" on projects for insert to authenticated with check (auth.jwt() ->> 'email' = 'zzummm@naver.com');
create policy "owner update projects" on projects for update to authenticated using (auth.jwt() ->> 'email' = 'zzummm@naver.com') with check (auth.jwt() ->> 'email' = 'zzummm@naver.com');
create policy "owner delete projects" on projects for delete to authenticated using (auth.jwt() ->> 'email' = 'zzummm@naver.com');

create policy "owner read schedules" on schedules for select to authenticated using (auth.jwt() ->> 'email' = 'zzummm@naver.com');
create policy "owner insert schedules" on schedules for insert to authenticated with check (auth.jwt() ->> 'email' = 'zzummm@naver.com');
create policy "owner update schedules" on schedules for update to authenticated using (auth.jwt() ->> 'email' = 'zzummm@naver.com') with check (auth.jwt() ->> 'email' = 'zzummm@naver.com');
create policy "owner delete schedules" on schedules for delete to authenticated using (auth.jwt() ->> 'email' = 'zzummm@naver.com');
