using AssetLifecycleService as service from '../../srv/asset-service';

annotate service.EmployeesSrv with @(
    UI.HeaderInfo : {
        TypeName : 'Employee',
        TypeNamePlural : 'Employees',
        Title : {
            Value : full_name
        }
    },

    UI.SelectionFields : [
        full_name,
        email,
        location,
        status
    ],

    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Employee Name',
                Value : full_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Phone Number',
                Value : phone,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Location',
                Value : location,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status,
            },
        ],
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Employee Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],

    UI.LineItem : [



        {
    $Type : 'UI.DataFieldForAction',
    Action : 'AssetLifecycleService.EntityContainer/createEmployee',
    Label : 'Create Employee',
    Inline : false
},

{
    $Type : 'UI.DataFieldForAction',
    Action : 'AssetLifecycleService.EntityContainer/updateEmployee',
    Label : 'Update Employee',
    Inline : false
},

{
    $Type : 'UI.DataFieldForAction',
    Action : 'AssetLifecycleService.EntityContainer/deleteEmployee',
    Label : 'Delete Employee',
    Inline : false
},
        {
            $Type : 'UI.DataField',
            Label : 'Employee Name',
            Value : full_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Phone Number',
            Value : phone,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Location',
            Value : location,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
        },
    ],
);

annotate service.EmployeesSrv with {
    department @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'DepartmentsSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : department_dept_id,
                ValueListProperty : 'dept_id',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'cost_center',
            },
        ],
    }
};