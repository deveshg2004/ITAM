using AssetLifecycleService as service from '../../srv/asset-service';

annotate service.AssetAssignmentsSrv with @(
    UI.HeaderInfo : {
        TypeName : 'Asset Assignment',
        TypeNamePlural : 'Asset Assignments',
        Title : {
            Value : assignment_status
        }
    },

    UI.SelectionFields : [
        employee_employee_id,
        asset_asset_id,
        assignment_status,
        assigned_date,
        expected_return_date
    ],

    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Assigned Date',
                Value : assigned_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Expected Return Date',
                Value : expected_return_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Actual Return Date',
                Value : actual_return_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Assignment Status',
                Value : assignment_status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Remarks',
                Value : remarks,
            },
        ],
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Assignment Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],

    UI.LineItem : [

         {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/createAssetAssignment',
        Label : 'Create Assignment',
        Inline : false
    },

    {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/updateAssetAssignment',
        Label : 'Update Assignment',
        Inline : false
    },


    {
    $Type : 'UI.DataFieldForAction',
    Action : 'AssetLifecycleService.EntityContainer/deleteAssetAssignment',
    Label : 'Delete Assignment',
    Inline : false
},

{
    $Type : 'UI.DataField',
    Label : 'Asset',
    Value : asset.asset_tag,
},

{
    $Type : 'UI.DataField',
    Label : 'Employee',
    Value : employee.full_name,
},

{
    $Type : 'UI.DataField',
    Label : 'Assigned Date',
    Value : assigned_date,
},

        {
            $Type : 'UI.DataField',
            Label : 'Expected Return Date',
            Value : expected_return_date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Actual Return Date',
            Value : actual_return_date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Assignment Status',
            Value : assignment_status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Remarks',
            Value : remarks,
        },
    ],
);

annotate service.AssetAssignmentsSrv with {
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

annotate service.AssetAssignmentsSrv with {
    employee @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'EmployeesSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : employee_employee_id,
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

annotate service.AssetAssignmentsSrv with {
    assigned_by @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'EmployeesSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : assigned_by_employee_id,
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

