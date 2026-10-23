using AssetLifecycleService as service from '../../srv/asset-service';

annotate service.OwnershipLedgersSrv with @(
    UI.HeaderInfo : {
        TypeName : 'Ownership Ledger',
        TypeNamePlural : 'Ownership Ledgers',
        Title : {
            Value : action
        }
    },

    UI.SelectionFields : [
        action,
        transition_date
    ],

    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Action',
                Value : action,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Transition Date',
                Value : transition_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Notes',
                Value : notes,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Created At',
                Value : created_at,
            },
        ],
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Ownership History',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Action',
            Value : action,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Transition Date',
            Value : transition_date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Notes',
            Value : notes,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Created At',
            Value : created_at,
        },
    ],
);

annotate service.OwnershipLedgersSrv with {
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

annotate service.OwnershipLedgersSrv with {
    from_employee @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'EmployeesSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : from_employee_employee_id,
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

annotate service.OwnershipLedgersSrv with {
    to_employee @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'EmployeesSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : to_employee_employee_id,
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

annotate service.OwnershipLedgersSrv with {
    recorded_by @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'EmployeesSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : recorded_by_employee_id,
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

