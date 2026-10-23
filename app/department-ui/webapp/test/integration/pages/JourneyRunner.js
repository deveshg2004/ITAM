sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"asset/lifecycle/departmentui/test/integration/pages/DepartmentsSrvList.gen",
	"asset/lifecycle/departmentui/test/integration/pages/DepartmentsSrvObjectPage.gen"
], function (JourneyRunner, DepartmentsSrvListGenerated, DepartmentsSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('asset/lifecycle/departmentui') + '/test/flp.html#app-preview',
        pages: {
			onTheDepartmentsSrvListGenerated: DepartmentsSrvListGenerated,
			onTheDepartmentsSrvObjectPageGenerated: DepartmentsSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

