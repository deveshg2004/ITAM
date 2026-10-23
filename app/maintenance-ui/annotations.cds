using AssetLifecycleService as service from '../../srv/asset-service';

annotate service.MaintenanceRecordsSrv with @(
    UI.HeaderInfo : {
        TypeName : 'Maintenance Record',
        TypeNamePlural : 'Maintenance Records',
        Title : {
            Value : type
        }
    },

    UI.SelectionFields : [
        type,
        status,
        reported_date,
        completed_date
    ],

    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Maintenance Type',
                Value : type,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Reported Date',
                Value : reported_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Completed Date',
                Value : completed_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Outcome',
                Value : outcome,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Cost',
                Value : cost,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Covered By Warranty',
                Value : covered_by_warranty,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Next Due Date',
                Value : next_due_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description,
            },
        ],
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Maintenance Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],

    UI.LineItem : [


        {
    $Type : 'UI.DataFieldForAction',
    Action : 'AssetLifecycleService.EntityContainer/createMaintenanceRecord',
    Label : 'Create Maintenance',
    Inline : false
},

{
    $Type : 'UI.DataFieldForAction',
    Action : 'AssetLifecycleService.EntityContainer/updateMaintenanceRecord',
    Label : 'Update Maintenance',
    Inline : false
},

{
    $Type : 'UI.DataFieldForAction',
    Action : 'AssetLifecycleService.EntityContainer/deleteMaintenanceRecord',
    Label : 'Delete Maintenance',
    Inline : false
},
        {
            $Type : 'UI.DataField',
            Label : 'Maintenance Type',
            Value : type,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Reported Date',
            Value : reported_date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Completed Date',
            Value : completed_date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Outcome',
            Value : outcome,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Cost',
            Value : cost,
        },
    ],
);

annotate service.MaintenanceRecordsSrv with {
    asset @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'AssetsSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : asset_asset_id,
                ValueListProperty : 'asset_id',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'asset_tag',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'serial_number',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'model',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'purchase_date',
            },
        ],
    }
};

annotate service.MaintenanceRecordsSrv with {
    reported_by @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'EmployeesSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : reported_by_employee_id,
                ValueListProperty : 'employee_id',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'full_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'location',
            },
        ],
    }
};

annotate service.MaintenanceRecordsSrv with {
    service_vendor @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'VendorsSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : service_vendor_vendor_id,
                ValueListProperty : 'vendor_id',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
        ],
    }
};

