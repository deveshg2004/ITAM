sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/viz/ui5/data/FlattenedDataset",
    "sap/viz/ui5/controls/common/feeds/FeedItem"
], function (
    Controller,
    JSONModel,
    FlattenedDataset,
    FeedItem
) {
    "use strict";

    return Controller.extend(
        "asset.lifecycle.dashboardui.controller.AssetDashboard",
        {

            onInit: function () {

                const oData = {
                    categories: [
                        { Category: "Laptops", Count: 5 },
                        { Category: "Mobiles", Count: 4 },
                        { Category: "Monitors", Count: 3 },
                        { Category: "Printers", Count: 2 },
                        { Category: "Accessories", Count: 1 }
                    ]
                };

                const oModel = new JSONModel(oData);
                this.getView().setModel(oModel);

                const oVizFrame = this.byId("assetCategoryChart");

                const oDataset = new FlattenedDataset({
                    dimensions: [{
                        name: "Category",
                        value: "{Category}"
                    }],
                    measures: [{
                        name: "Assets",
                        value: "{Count}"
                    }],
                    data: {
                        path: "/categories"
                    }
                });

                oVizFrame.setDataset(oDataset);
                oVizFrame.setModel(oModel);

                oVizFrame.addFeed(new FeedItem({
                    uid: "size",
                    type: "Measure",
                    values: ["Assets"]
                }));

                oVizFrame.addFeed(new FeedItem({
                    uid: "color",
                    type: "Dimension",
                    values: ["Category"]
                }));
                oVizFrame.setVizProperties({
    title: {
        visible: false
    },
    legend: {
        visible: true
    },
    plotArea: {
        dataLabel: {
            visible: true,
            showTotal: false,
            type: "value"
        }
    }
});
            },

            onAssetManagement: function () {
                window.location.href =
                "/asset.lifecycle.assetui/index.html";
            },

            onEmployeeManagement: function () {
                window.location.href =
                "/asset.lifecycle.employeeui/index.html";
            },

            onAssignmentManagement: function () {
                window.location.href =
                "/asset.lifecycle.assetassignmentui/index.html";
            },

            onMaintenanceManagement: function () {
                window.location.href =
                "/asset.lifecycle.maintenanceui/index.html";
            },

            onOwnershipLedger: function () {
                window.location.href =
                "/asset.lifecycle.ownershipledgerui/index.html";
            },

            onArchiveManagement: function () {
                window.location.href =
                "/asset.lifecycle.archiveui/index.html";
            },
            onReports() {
    window.location.href =
    "/asset.lifecycle.reportsui/index.html";
},

onManagerDashboard() {
    window.location.href =
    "/asset.lifecycle.managerdashboardui/index.html";
},

onEmployeeDashboard() {
    window.location.href =
    "/asset.lifecycle.employeedashboardui/index.html";
},

        }
    );
});