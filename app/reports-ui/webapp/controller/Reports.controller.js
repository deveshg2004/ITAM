sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend(
        "asset.lifecycle.reportsui.controller.Reports",
        {

            onInit() {
            },

            onAssetReport() {
                window.location.href =
                "/asset.lifecycle.assetui/index.html";
            },

            onEmployeeReport() {
                window.location.href =
                "/asset.lifecycle.employeeui/index.html";
            },

            onMaintenanceReport() {
                window.location.href =
                "/asset.lifecycle.maintenanceui/index.html";
            },

            onAssignmentReport() {
                window.location.href =
                "/asset.lifecycle.assetassignmentui/index.html";
            },

            onExportAssets() {

                const csv =
`Asset Tag,Model,Status
LAP001,Dell Latitude,AVAILABLE
MOB001,iPhone 15,ASSIGNED
MON001,HP Monitor,AVAILABLE`;

                const blob = new Blob([csv], {
                    type: "text/csv;charset=utf-8;"
                });

                const url = URL.createObjectURL(blob);

                const link = document.createElement("a");
                link.href = url;
                link.download = "AssetReport.csv";
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);

            },

            onExportEmployees() {

                const csv =
`Employee Name,Email,Location
John Doe,john@company.com,Chennai
Jane Smith,jane@company.com,Bangalore`;

                const blob = new Blob([csv], {
                    type: "text/csv;charset=utf-8;"
                });

                const url = URL.createObjectURL(blob);

                const link = document.createElement("a");
                link.href = url;
                link.download = "EmployeeReport.csv";
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);

            },

            onExportMaintenance() {

                const csv =
`Maintenance ID,Status,Cost
M001,COMPLETED,5000
M002,PENDING,2500`;

                const blob = new Blob([csv], {
                    type: "text/csv;charset=utf-8;"
                });

                const url = URL.createObjectURL(blob);

                const link = document.createElement("a");
                link.href = url;
                link.download = "MaintenanceReport.csv";
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);

            },

            onExportAssignments() {

                const csv =
`Assignment ID,Status,Remarks
A001,ASSIGNED,Laptop issued
A002,RETURNED,Asset returned`;

                const blob = new Blob([csv], {
                    type: "text/csv;charset=utf-8;"
                });

                const url = URL.createObjectURL(blob);

                const link = document.createElement("a");
                link.href = url;
                link.download = "AssignmentReport.csv";
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);

            }

        }
    );
});