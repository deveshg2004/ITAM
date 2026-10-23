sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"asset/lifecycle/assetui/test/integration/pages/AssetsSrvList.gen",
	"asset/lifecycle/assetui/test/integration/pages/AssetsSrvObjectPage.gen"
], function (JourneyRunner, AssetsSrvListGenerated, AssetsSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('asset/lifecycle/assetui') + '/test/flp.html#app-preview',
        pages: {
			onTheAssetsSrvListGenerated: AssetsSrvListGenerated,
			onTheAssetsSrvObjectPageGenerated: AssetsSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

