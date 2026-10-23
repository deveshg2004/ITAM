sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/viz/ui5/data/FlattenedDataset",
    "sap/viz/ui5/controls/common/feeds/FeedItem"
], (
    Controller,
    JSONModel,
    FlattenedDataset,
    FeedItem
) => {
    "use strict";

    return Controller.extend(
        "asset.lifecycle.managerdashboardui.controller.ManagerDashboard",
        {

            onInit() {

                const oData = {
                    departments: [
                        {
                            Department: "IT",
                            Assets: 6
                        },
                        {
                            Department: "Finance",
                            Assets: 4
                        },
                        {
                            Department: "HR",
                            Assets: 3
                        },
                        {
                            Department: "Administration",
                            Assets: 2
                        }
                    ]
                };

                const oModel = new JSONModel(oData);
                this.getView().setModel(oModel);

                const oVizFrame = this.byId("departmentBarChart");

                const oDataset = new FlattenedDataset({
                    dimensions: [{
                        name: "Department",
                        value: "{Department}"
                    }],
                    measures: [{
                        name: "Assets",
                        value: "{Assets}"
                    }],
                    data: {
                        path: "/departments"
                    }
                });

                oVizFrame.setDataset(oDataset);
                oVizFrame.setModel(oModel);

                oVizFrame.addFeed(new FeedItem({
                    uid: "valueAxis",
                    type: "Measure",
                    values: ["Assets"]
                }));

                oVizFrame.addFeed(new FeedItem({
                    uid: "categoryAxis",
                    type: "Dimension",
                    values: ["Department"]
                }));

                oVizFrame.setVizProperties({
                    title: {
                        visible: false
                    },
                    plotArea: {
                        dataLabel: {
                            visible: true,
                            type: "value"
                        }
                    },
                    valueAxis: {
                        title: {
                            visible: false
                        }
                    },
                    categoryAxis: {
                        title: {
                            visible: false
                        }
                    }
                });

            },

            onAssetManagement() {
                window.location.href =
                "/asset.lifecycle.assetui/index.html";
            },

            onEmployeeManagement() {
                window.location.href =
                "/asset.lifecycle.employeeui/index.html";
            },

            onAssignmentManagement() {
                window.location.href =
                "/asset.lifecycle.assetassignmentui/index.html";
            },

            onMaintenanceManagement() {
                window.location.href =
                "/asset.lifecycle.maintenanceui/index.html";
            }

        }
    );
});