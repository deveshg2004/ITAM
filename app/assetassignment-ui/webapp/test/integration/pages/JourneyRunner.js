sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"asset/lifecycle/assetassignmentui/test/integration/pages/AssetAssignmentsSrvList.gen",
	"asset/lifecycle/assetassignmentui/test/integration/pages/AssetAssignmentsSrvObjectPage.gen"
], function (JourneyRunner, AssetAssignmentsSrvListGenerated, AssetAssignmentsSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('asset/lifecycle/assetassignmentui') + '/test/flp.html#app-preview',
        pages: {
			onTheAssetAssignmentsSrvListGenerated: AssetAssignmentsSrvListGenerated,
			onTheAssetAssignmentsSrvObjectPageGenerated: AssetAssignmentsSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

