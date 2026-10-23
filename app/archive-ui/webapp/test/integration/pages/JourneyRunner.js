sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"asset/lifecycle/archiveui/test/integration/pages/ArchiveRecordsSrvList.gen",
	"asset/lifecycle/archiveui/test/integration/pages/ArchiveRecordsSrvObjectPage.gen"
], function (JourneyRunner, ArchiveRecordsSrvListGenerated, ArchiveRecordsSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('asset/lifecycle/archiveui') + '/test/flp.html#app-preview',
        pages: {
			onTheArchiveRecordsSrvListGenerated: ArchiveRecordsSrvListGenerated,
			onTheArchiveRecordsSrvObjectPageGenerated: ArchiveRecordsSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

