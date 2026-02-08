# Traxelio Project Notes

## Project Structure
- Laravel app with Filament admin panel
- Enums heavily used for features, plans, industries, device models
- Landing pages extend `layout.landing` with `element.header` and `element.footer`
- CTA buttons link to `route('lead.create')` (Filament resource route)
- Routes in `routes/web.php`, lint via `composer lint:fix` (php-cs-fixer)
- Tests via `composer test` (parallel, 8 processes, ~300s timeout)
- CSS: Tailwind with primary/secondary color tokens
- JS: Alpine.js for interactivity (accordions, search)

## Code Style
- Double quotes for strings (enforced by php-cs-fixer)
- Linter auto-reformats import order and class formatting
- `$guarded = ['id']` pattern for models
- Route key name via `getRouteKeyName()` for slug-based routing

## pSEO Implementation (Feb 2026)
- TrackerDevice model at `app/Models/TrackerDevice.php`
- Import command: `php artisan trackers:import` scrapes traccar.org/devices/
- Traccar page: `<tbody id="devices">` contains rows, not `<table id="devices">`
- Device names need HTML entity decode + non-breaking space cleanup + badge text removal
- Devices with protocol `-` or `clones` should be skipped
- Brand extraction: known brand map > protocol-based map > first word if uppercase > protocol title
- ~1,530 devices across ~522 brands after import

## Key Patterns
- Feature pages: `features/show.blade.php` (FAQ accordion, structured data, feature cards)
- Industry pages: `industries/show.blade.php` (challenges/solutions, testimonial, related)
- Gradient text class: `.gradient-text` with pink-to-orange gradient
- Hero gradient class: `.hero-gradient`
- Feature card hover: `.feature-card` with translateY(-4px)
