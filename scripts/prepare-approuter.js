const fs = require('fs');
const path = require('path');

const root = path.resolve(__dirname, '..');
const router = path.join(root, '.deploy', 'app-router');
const apps = [
  'dashboard-ui',
  'manager-dashboard-ui',
  'employee-dashboard-ui',
  'asset-ui',
  'employee-ui',
  'assetassignment-ui',
  'maintenance-ui',
  'ownershipledger-ui',
  'archive-ui',
  'department-ui',
  'reports-ui'
];

fs.mkdirSync(router, { recursive: true });

for (const app of apps) {
  const dist = path.join(root, 'app', app, 'dist');
  const target = path.join(router, app);
  if (!fs.existsSync(dist)) {
    throw new Error(`Missing UI build output: ${dist}`);
  }
  fs.rmSync(target, { recursive: true, force: true });
  fs.cpSync(dist, target, { recursive: true });
}

const index = `<!doctype html><html><head><meta charset="utf-8"><title>IT Asset Lifecycle Manager</title></head><body><h1>IT Asset Lifecycle Manager</h1><p>Select an application:</p><ul>${apps.map(a => `<li><a href="/${a}/index.html">${a}</a></li>`).join('')}</ul></body></html>`;
fs.writeFileSync(path.join(router, 'index.html'), index);

console.log(`Prepared ${apps.length} UI applications in ${router}`);
