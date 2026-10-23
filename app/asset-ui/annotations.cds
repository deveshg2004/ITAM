using AssetLifecycleService as service from '../../srv/asset-service';
annotate service.AssetsSrv with @(
    UI.HeaderInfo : {
        TypeName : 'Asset',
        TypeNamePlural : 'Assets',
        Title : {
            Value : asset_tag
        }
    },

    UI.SelectionFields : [
        asset_tag,
        model,
        status,
        purchase_date
    ],

    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Asset Tag',
                Value : asset_tag,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Serial Number',
                Value : serial_number,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Model',
                Value : model,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Purchase Date',
                Value : purchase_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Purchase Cost',
                Value : purchase_cost,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Warranty Expiry',
                Value : warranty_expiry,
            },
            {
                $Type : 'UI.DataField',
                Label : 'First Distribution Date',
                Value : first_distribution_date,
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
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],

UI.LineItem : [

    {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/createAsset',
        Label : 'Create Asset',
        Inline : false
    },

    {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/updateAsset',
        Label : 'Update Asset',
        Inline : false
    },

    {
        $Type : 'UI.DataFieldForAction',
        Action : 'AssetLifecycleService.EntityContainer/deleteAsset',
        Label : 'Delete Asset',
        Inline : false
    },

    // {
    //     $Type : 'UI.DataFieldForAction',
    //     Action : 'AssetLifecycleService.EntityContainer/AssignAsset',
    //     Label : 'Assign Asset',
    //     Inline : false
    // },

    // {
    //     $Type : 'UI.DataFieldForAction',
    //     Action : 'AssetLifecycleService.EntityContainer/TransferAsset',
    //     Label : 'Transfer Asset',
    //     Inline : false
    // },

    // {
    //     $Type : 'UI.DataFieldForAction',
    //     Action : 'AssetLifecycleService.EntityContainer/ReturnAsset',
    //     Label : 'Return Asset',
    //     Inline : false
    // },

    // {
    //     $Type : 'UI.DataFieldForAction',
    //     Action : 'AssetLifecycleService.EntityContainer/RetireAsset',
    //     Label : 'Retire Asset',
    //     Inline : false
    // },

    // {
    //     $Type : 'UI.DataFieldForAction',
    //     Action : 'AssetLifecycleService.EntityContainer/ArchiveAsset',
    //     Label : 'Archive Asset',
    //     Inline : false
    // },

    {
        $Type : 'UI.DataField',
        Label : 'Asset Tag',
        Value : asset_tag,
    },

    {
        $Type : 'UI.DataField',
        Label : 'Serial Number',
        Value : serial_number,
    },

    {
        $Type : 'UI.DataField',
        Label : 'Model',
        Value : model,
    },

    {
        $Type : 'UI.DataField',
        Label : 'Purchase Date',
        Value : purchase_date,
    },

    {
        $Type : 'UI.DataField',
        Label : 'Purchase Cost',
        Value : purchase_cost,
    },

    {
        $Type : 'UI.DataField',
        Label : 'Status',
        Value : status,
    },

    {
        $Type : 'UI.DataField',
        Label : 'Warranty Expiry',
        Value : warranty_expiry,
    }
],

);

annotate service.AssetsSrv with {
    assetCategory @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'AssetCategoriesSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : assetCategory_asset_category_id,
                ValueListProperty : 'asset_category_id',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'lifespan_months',
            },
        ],
    }
};

annotate service.AssetsSrv with {
    vendor @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'VendorsSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : vendor_vendor_id,
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

annotate service.AssetsSrv with {
    current_holder @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'EmployeesSrv',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : current_holder_employee_id,
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

