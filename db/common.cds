namespace asset.lifecycle;

type AssetStatus : String enum {
    AVAILABLE;
    ASSIGNED;
    MAINTENANCE;
    RETIRED;
    ARCHIVED;
};

type EmployeeStatus : String enum {
    ACTIVE;
    INACTIVE;
    OFFBOARDED;
};

type MaintenanceStatus : String enum {
    OPEN;
    IN_PROGRESS;
    COMPLETED;
};

type AssignmentStatus : String enum {
    ASSIGNED;
    RETURNED;
};

type LedgerAction : String enum {
    ASSIGN;
    TRANSFER;
    RETURN;
    RETIRE;
};