using DatamodelService as service from '../../srv/service';

annotate service.BusinessPartners with @(
    UI.SelectionFields : [ BP_ROLE, PHONE_NUMBER, BP_ID ],

    UI.FieldGroup #GeneralGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'NODE_KEY',        Value : NODE_KEY },
            { $Type : 'UI.DataField', Label : 'BP_ROLE',         Value : BP_ROLE },
            { $Type : 'UI.DataField', Label : 'EMAIL_ADDRESS',   Value : EMAIL_ADDRESS },
            { $Type : 'UI.DataField', Label : 'PHONE_NUMBER',    Value : PHONE_NUMBER },
            { $Type : 'UI.DataField', Label : 'FAX_NUMBER',      Value : FAX_NUMBER },
            { $Type : 'UI.DataField', Label : 'WEB_ADDRESS',     Value : WEB_ADDRESS },
            { $Type : 'UI.DataField', Label : 'ADDRESS_GUID',    Value : ADDRESS_GUID },
            { $Type : 'UI.DataField', Label : 'BP_ID',           Value : BP_ID },
            { $Type : 'UI.DataField', Label : 'COMPANY_NAME',    Value : COMPANY_NAME }
        ]
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralInformation',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneralGroup'
        }
    ],

    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'NODE_KEY',        Value : NODE_KEY },
        { $Type : 'UI.DataField', Label : 'BP_ROLE',         Value : BP_ROLE },
        { $Type : 'UI.DataField', Label : 'EMAIL_ADDRESS',   Value : EMAIL_ADDRESS },
        { $Type : 'UI.DataField', Label : 'PHONE_NUMBER',    Value : PHONE_NUMBER },
        { $Type : 'UI.DataField', Label : 'FAX_NUMBER',      Value : FAX_NUMBER }
    ]
);


annotate service.BusinessPartners with {
    ADDRESS_GUID @Common.ValueList : {
        $Type          : 'Common.ValueListType',
        CollectionPath : 'Addresses',
        Parameters : [
            { $Type : 'Common.ValueListParameterInOut',     LocalDataProperty : ADDRESS_GUID, ValueListProperty : 'NODE_KEY' },
            { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'CITY' },
            { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'POSTAL_CODE' },
            { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'STREET' },
            { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'BUILDING' }
        ]
    }
};


annotate service.PurchaseOrders with @(
    UI.SelectionFields : [ PO_ID, PARTNER_GUID, OVERALL_STATUS ],

    UI.LineItem : [
        { Value : PO_ID,            Label : 'PO ID' },
        { Value : PARTNER_GUID,     Label : 'Partner' },
        { Value : LIFECYCLE_STATUS, Label : 'Life Cycle Status' },
        { Value : OVERALL_STATUS,   Label : 'Overall Status' }
    ],

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'IdentificationFacet',
            Label : 'Identification',
            Target: '@UI.FieldGroup#IdentificationGroup'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'DetailsFacet',
            Label : 'Details',
            Target: '@UI.FieldGroup#DetailsGroup'
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ItemsFacet',
            Label : 'Purchase Order Items',
            Target : 'Items/@UI.LineItem'
        }
    ],

    UI.FieldGroup #IdentificationGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { Value : PO_ID,            Label : 'PO ID' },
            { Value : PARTNER_GUID,     Label : 'Partner' },
            { Value : OVERALL_STATUS,   Label : 'Overall Status' },
            { Value : LIFECYCLE_STATUS, Label : 'Life Cycle Status' }
        ]
    },

    UI.FieldGroup #DetailsGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { Value : AMOUNT,         Label : 'Amount' },
            { Value : CURRENCY_CODE,  Label : 'Currency' },
            { Value : createdAt,      Label : 'Created At' },
            { Value : modifiedAt,     Label : 'Modified At' }
        ]
    }
);


annotate service.POItems with @UI.LineItem : [
    { Value : PO_ITEM_POS,  Label : 'Item No' },
    { Value : PRODUCT_GUID, Label : 'Product' },
    { Value : QUANTITY,     Label : 'Quantity' },
    { Value : ITEM_PRICE,   Label : 'Item Price' }
];
