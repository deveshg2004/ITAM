using { asset.lifecycle as common } from './common';

namespace asset.lifecycle;

entity Department {
    key dept_id      : UUID;
        name         : String(80);
        cost_center  : String(20);
        employees    : Association to many Employee on employees.department = $self;
}

entity Employee {

    key employee_id : UUID;
        full_name   : String(100);
        email       : String(100);
        phone       : String(10);
        location    : String(100);
        status      : common.EmployeeStatus;
        department  : Association to Department;
}

entity AssetCategory {
    key asset_category_id : UUID;
        name              : String(50);
        lifespan_months   : Integer;
        assets            : Association to many Asset on assets.assetCategory = $self;
}

entity Vendor {
    key vendor_id : UUID;
        name      : String(100);
        email     : String(100);
        assets    : Association to many Asset on assets.vendor = $self;
}

entity Asset {
    key asset_id                 : UUID;
        asset_tag                : String(20);
        serial_number            : String(50);
        assetCategory            : Association to AssetCategory;
        vendor                   : Association to Vendor;
        model                    : String(100);
        purchase_date            : Date;
        purchase_cost            : Decimal(10,2);
        warranty_expiry          : Date;
        first_distribution_date  : Date;
        status                   : common.AssetStatus;
        current_holder           : Association to Employee;
}

entity AssetAssignment {
    key assignment_id            : UUID;
        asset                    : Association to Asset;
        employee                 : Association to Employee;
        assigned_by              : Association to Employee;
        assigned_date            : Timestamp;
        expected_return_date     : Date;
        actual_return_date       : Date;
        assignment_status        : common.AssignmentStatus;
        remarks                  : String(500);
}

entity OwnershipLedger {
    key ledger_id                : UUID;
        asset                    : Association to Asset;
        from_employee            : Association to Employee;
        to_employee              : Association to Employee;
        action                   : common.LedgerAction;
        transition_date          : Date;
        recorded_by              : Association to Employee;
        notes                    : String(500);
        created_at               : Timestamp;
}

entity MaintenanceRecord {
    key maintenance_id           : UUID;
        asset                    : Association to Asset;
        type                     : String(50);
        reported_by              : Association to Employee;
        service_vendor           : Association to Vendor;
        reported_date            : Date;
        completed_date           : Date;
        status                   : common.MaintenanceStatus;
        outcome                  : String(255);
        cost                     : Decimal(10,2);
        covered_by_warranty      : Boolean;
        next_due_date            : Date;
        description              : String(1000);
}

entity ArchiveRecord {
    key archive_id               : UUID;
        asset                    : Association to Asset;
        archived_at              : Timestamp;
        archived_by              : Association to Employee;
        reason                   : String(255);
        disposal_method          : String(50);
        disposal_cert_no         : String(40);
}