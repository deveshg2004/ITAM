sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"asset/lifecycle/employeeui/test/integration/pages/EmployeesSrvList.gen",
	"asset/lifecycle/employeeui/test/integration/pages/EmployeesSrvObjectPage.gen"
], function (JourneyRunner, EmployeesSrvListGenerated, EmployeesSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('asset/lifecycle/employeeui') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesSrvListGenerated: EmployeesSrvListGenerated,
			onTheEmployeesSrvObjectPageGenerated: EmployeesSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

