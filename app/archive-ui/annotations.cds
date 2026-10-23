using AssetLifecycleService as service from '../../srv/asset-service';

annotate service.ArchiveRecordsSrv with @(
    UI.HeaderInfo : {
        TypeName : 'Archive Record',
        TypeNamePlural : 'Archive Records',
        Title : {
            Value : disposal_cert_no
        }
    },

    UI.SelectionFields : [
        archived_at,
        disposal_method,
        reason
    ],

    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Archived Date',
                Value : archived_at,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Reason',
                Value : reason,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Disposal Method',
                Value : disposal_method,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Disposal Certificate Number',
                Value : disposal_cert_no,
            },
        ],
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Archive Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],

    UI.LineItem : [
            {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/createArchiveRecord',
        Label : 'Create Archive Record',
        Inline : false
    },

    {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/updateArchiveRecord',
        Label : 'Update Archive Record',
        Inline : false
    },

    {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/deleteArchiveRecord',
        Label : 'Delete Archive Record',
        Inline : false
    },
        {
            $Type : 'UI.DataField',
            Label : 'Archived Date',
            Value : archived_at,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Reason',
            Value : reason,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Disposal Method',
            Value : disposal_method,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Disposal Certificate Number',
            Value : disposal_cert_no,
        },
    ],
);
annotate service.ArchiveRecordsSrv with {
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

annotate service.ArchiveRecordsSrv with {
    archived_by @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'EmployeesSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : archived_by_employee_id,
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

