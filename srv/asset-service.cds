using { asset.lifecycle as db } from '../db/schema';

@(requires: 'authenticated-user')
service AssetLifecycleService {

    @(requires: 'Admin')
    entity DepartmentsSrv as projection on db.Department;

    @(requires: ['Admin','Manager'])
    entity EmployeesSrv as projection on db.Employee;

    @(requires: ['Admin','Manager'])
    entity VendorsSrv as projection on db.Vendor;

    @(requires: ['Admin','Manager'])
    entity AssetCategoriesSrv as projection on db.AssetCategory;

    @(requires: 'Admin')
    entity AssetsSrv as projection on db.Asset;

    @(requires: ['Admin','Manager'])
    entity AssetAssignmentsSrv as projection on db.AssetAssignment;

    @(requires: 'Admin')
    entity OwnershipLedgersSrv as projection on db.OwnershipLedger;

    @(requires: ['Admin','Manager'])
    entity MaintenanceRecordsSrv as projection on db.MaintenanceRecord;

    @(requires: 'Admin')
    entity ArchiveRecordsSrv as projection on db.ArchiveRecord;

    // Business Actions

    @(requires: ['Admin','Manager'])
    action AssignAsset(
        assetId    : UUID,
        employeeId : UUID
    ) returns String;

    @(requires: ['Admin','Manager'])
    action TransferAsset(
        assetId        : UUID,
        fromEmployeeId : UUID,
        toEmployeeId   : UUID
    ) returns String;

    @(requires: ['Admin','Manager'])
    action ReturnAsset(
        assetId : UUID
    ) returns String;

    @(requires: ['Admin','Manager'])
    action RetireAsset(
        assetId : UUID,
        reason  : String
    ) returns String;

    @(requires: 'Admin')
    action ArchiveAsset(
        assetId : UUID,
        reason  : String
    ) returns String;

    // Manager raises requests to Admin

    @(requires: ['Admin','Manager'])
    action RequestAsset(
        employeeId : UUID,
        assetId    : UUID
    ) returns String;

    @(requires: 'Admin')
    action ApproveAssetRequest(
        assignmentId : UUID
    ) returns String;

    @(requires: ['Admin','Manager'])
    action CompleteMaintenance(
        maintenanceId : UUID
    ) returns String;

    // Employee CRUD

    @(requires: ['Admin','Manager'])
    action createEmployee(
        employee_id : UUID,
        full_name   : String,
        email       : String,
        phone       : String,
        location    : String,
        status      : String
    ) returns array of EmployeesSrv;

    @(requires: ['Admin','Manager'])
    action updateEmployee(
        employee_id : UUID,
        phone       : String,
        location    : String,
        status      : String
    ) returns String;

    @(requires: 'Admin')
    action deleteEmployee(
        employee_id : UUID
    ) returns String;

    // Asset CRUD

    @(requires: 'Admin')
    action createAsset(
        asset_id      : UUID,
        asset_tag     : String,
        serial_number : String,
        model         : String,
        purchase_cost : Decimal(10,2)
    ) returns array of AssetsSrv;

    @(requires: 'Admin')
    action updateAsset(
        asset_id : UUID,
        status   : String
    ) returns String;

    @(requires: 'Admin')
    action deleteAsset(
        asset_id : UUID
    ) returns String;

    // Maintenance CRUD

    @(requires: ['Admin','Manager'])
    action createMaintenanceRecord(
        maintenance_id : UUID,
        type           : String,
        status         : String,
        cost           : Decimal(10,2)
    ) returns array of MaintenanceRecordsSrv;

    @(requires: ['Admin','Manager'])
    action updateMaintenanceRecord(
        maintenance_id : UUID,
        status         : String
    ) returns String;

    @(requires: 'Admin')
    action deleteMaintenanceRecord(
        maintenance_id : UUID
    ) returns String;

    // Asset Assignment CRUD

    @(requires: ['Admin','Manager'])
    action createAssetAssignment(
        assignment_id        : UUID,
        assigned_date        : DateTime,
        expected_return_date : DateTime,
        assignment_status    : String,
        remarks              : String
    ) returns array of AssetAssignmentsSrv;

    @(requires: ['Admin','Manager'])
    action updateAssetAssignment(
        assignment_id     : UUID,
        assignment_status : String,
        remarks           : String
    ) returns String;

    @(requires: 'Admin')
    action deleteAssetAssignment(
        assignment_id : UUID
    ) returns String;

    // Department CRUD

    @(requires: 'Admin')
    action createDepartment(
        dept_id     : UUID,
        name        : String,
        cost_center : String
    ) returns array of DepartmentsSrv;

    @(requires: 'Admin')
    action updateDepartment(
        dept_id     : UUID,
        name        : String,
        cost_center : String
    ) returns String;

    @(requires: 'Admin')
    action deleteDepartment(
        dept_id : UUID
    ) returns String;

    // Archive CRUD

    @(requires: 'Admin')
    action createArchiveRecord(
        archive_id       : UUID,
        archived_at      : Timestamp,
        reason           : String,
        disposal_method  : String,
        disposal_cert_no : String
    ) returns array of ArchiveRecordsSrv;

    @(requires: 'Admin')
    action updateArchiveRecord(
        archive_id       : UUID,
        reason           : String,
        disposal_method  : String,
        disposal_cert_no : String
    ) returns String;

    @(requires: 'Admin')
    action deleteArchiveRecord(
        archive_id : UUID
    ) returns String;
}


