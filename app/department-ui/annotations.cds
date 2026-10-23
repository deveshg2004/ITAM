using AssetLifecycleService as service from '../../srv/asset-service';
annotate service.DepartmentsSrv with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'cost_center',
                Value : cost_center,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
         {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/createDepartment',
        Label : 'Create Department',
        Inline : false
    },

    {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/updateDepartment',
        Label : 'Update Department',
        Inline : false
    },

    {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/deleteDepartment',
        Label : 'Delete Department',
        Inline : false
    },
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'cost_center',
            Value : cost_center,
        },
    ],
);

