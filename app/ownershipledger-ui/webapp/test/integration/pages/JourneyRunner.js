sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"asset/lifecycle/ownershipledgerui/test/integration/pages/OwnershipLedgersSrvList.gen",
	"asset/lifecycle/ownershipledgerui/test/integration/pages/OwnershipLedgersSrvObjectPage.gen"
], function (JourneyRunner, OwnershipLedgersSrvListGenerated, OwnershipLedgersSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('asset/lifecycle/ownershipledgerui') + '/test/flp.html#app-preview',
        pages: {
			onTheOwnershipLedgersSrvListGenerated: OwnershipLedgersSrvListGenerated,
			onTheOwnershipLedgersSrvObjectPageGenerated: OwnershipLedgersSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

