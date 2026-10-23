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
        "asset.lifecycle.employeedashboardui.controller.EmployeeDashboard",
        {

            onInit() {

                const oData = {
                    assets: [
                        {
                            AssetType: "Laptop",
                            Count: 1
                        },
                        {
                            AssetType: "Monitor",
                            Count: 1
                        },
                        {
                            AssetType: "Mobile",
                            Count: 1
                        }
                    ]
                };

                const oModel = new JSONModel(oData);
                this.getView().setModel(oModel);

                const oVizFrame = this.byId("employeeAssetChart");

                const oDataset = new FlattenedDataset({
                    dimensions: [{
                        name: "Asset Type",
                        value: "{AssetType}"
                    }],
                    measures: [{
                        name: "Assigned",
                        value: "{Count}"
                    }],
                    data: {
                        path: "/assets"
                    }
                });

                oVizFrame.setDataset(oDataset);
                oVizFrame.setModel(oModel);

                oVizFrame.addFeed(new FeedItem({
                    uid: "size",
                    type: "Measure",
                    values: ["Assigned"]
                }));

                oVizFrame.addFeed(new FeedItem({
                    uid: "color",
                    type: "Dimension",
                    values: ["Asset Type"]
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
                            type: "value"
                        }
                    }
                });

                // Default content

                this.byId("contentTitle").setText("My Profile");

                this.byId("contentText").setText(
                    "Employee Name : Rahul Sharma\n" +
                    "Email : rahul.sharma@company.com\n" +
                    "Department : IT\n" +
                    "Location : Bangalore\n" +
                    "Status : Active"
                );

            },

            onMyProfile() {

                this.byId("contentTitle").setText("My Profile");

                this.byId("contentText").setText(
                    "Employee Name : Rahul Sharma\n" +
                    "Email : rahul.sharma@company.com\n" +
                    "Department : IT\n" +
                    "Location : Bangalore\n" +
                    "Status : Active"
                );

            },

            onMyAssets() {

                this.byId("contentTitle").setText("My Assets");

                this.byId("contentText").setText(
                    "Laptop  - LAP001\n" +
                    "Monitor - MON001\n" +
                    "Mobile  - MOB001"
                );

            },

            onMyRequests() {

                this.byId("contentTitle").setText("My Requests");

                this.byId("contentText").setText(
                    "REQ001 - Approved\n" +
                    "REQ002 - Pending\n" +
                    "REQ003 - Completed"
                );

            },

            onMaintenanceHistory() {

                this.byId("contentTitle").setText("Maintenance History");

                this.byId("contentText").setText(
                    "LAP001 - Battery Replacement\n" +
                    "MON001 - Display Issue Resolved"
                );

            }

        }
    );
});