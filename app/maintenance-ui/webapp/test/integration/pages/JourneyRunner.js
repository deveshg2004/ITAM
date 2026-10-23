sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"asset/lifecycle/maintenanceui/test/integration/pages/MaintenanceRecordsSrvList.gen",
	"asset/lifecycle/maintenanceui/test/integration/pages/MaintenanceRecordsSrvObjectPage.gen"
], function (JourneyRunner, MaintenanceRecordsSrvListGenerated, MaintenanceRecordsSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('asset/lifecycle/maintenanceui') + '/test/flp.html#app-preview',
        pages: {
			onTheMaintenanceRecordsSrvListGenerated: MaintenanceRecordsSrvListGenerated,
			onTheMaintenanceRecordsSrvObjectPageGenerated: MaintenanceRecordsSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

