# Portal Project Memory

## Project Setup
- **Framework**: Laravel 12.50.0 (upgraded from 11.45.1 on branch CRM-840)
- **PHP**: Requires ^8.4 (local machine runs 8.3.17 — use `--ignore-platform-reqs` for composer commands)
- **Database**: MySQL for dev/tests, SQLite config exists but not used for tests
- **Tests**: Run via `.env.testing` with `DB_CONNECTION=mysql`, `DB_DATABASE=allocations_test`
- **Frontend**: Filament 3.x, Tailwind v3 (NOT v4), Livewire 3.x
- **Deployment**: Laravel Vapor

## Key Packages
- `larastan/larastan` ^3.0 (bumped from ^2.2 during L12 upgrade)
- `bugsnag/bugsnag-laravel` with OomBootstrapper in bootstrap/app.php
- `saloonphp/laravel-plugin` ^3.8, `saloonphp/saloon` ^3.14
- `laravel/passport` ^12.0

## Testing Notes
- phpunit.xml does NOT set DB_CONNECTION/DB_DATABASE — tests use .env.testing (MySQL)
- Project uses MySQL-specific raw SQL (year(), month(), concat(), SUBSTRING_INDEX) — cannot switch to SQLite for tests
- Some migrations have SQLite-incompatible patterns (morph index names matching table names, renameIndex on foreign keys, adding PRIMARY KEY via ALTER TABLE)
- `ContractTest::testScopeWithStatusFiltersByActiveStatus` is flaky in full suite but passes alone

## Laravel 12 Upgrade Notes
- `composer update -W` required for dependency resolution (not just `composer update`)
- larastan ^2.x does not support Laravel 12 — must bump to ^3.0
- SQLite grammar changes in L12: CREATE INDEX is now separate (not inline), so index names cannot match table names
- SQLite in L12 no longer allows adding PRIMARY KEY columns via ALTER TABLE
- SQLite in L12 validates index existence for renameIndex (foreign key indexes may not exist as separate indexes in SQLite)
