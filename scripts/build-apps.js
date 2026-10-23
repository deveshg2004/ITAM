// Copies the UI5 apps next to the CAP server for the BTP deployment (gen/srv/app is served
// statically by CAP). Each app is published under its sap.app.id, e.g. /asset.lifecycle.assetui/,
// i.e. the same URLs as cds-plugin-ui5 uses in BAS. The .cds annotation files are not copied:
// they are already compiled into gen/srv/srv/csn.json and would fail to compile again there.
const fs = require('fs');
const path = require('path');

const root = path.resolve(__dirname, '..');
const target = path.join(root, 'gen', 'srv', 'app');

fs.rmSync(target, { recursive: true, force: true });
fs.mkdirSync(target, { recursive: true });
fs.copyFileSync(path.join(root, 'app', 'index.html'), path.join(target, 'index.html'));

for (const dir of fs.readdirSync(path.join(root, 'app'))) {
    const webapp = path.join(root, 'app', dir, 'webapp');
    const manifest = path.join(webapp, 'manifest.json');
    if (!fs.existsSync(manifest)) continue;
    const id = JSON.parse(fs.readFileSync(manifest, 'utf8'))['sap.app'].id;
    fs.cpSync(webapp, path.join(target, id), { recursive: true });
    console.log(`app/${dir}/webapp -> /${id}/`);
}
