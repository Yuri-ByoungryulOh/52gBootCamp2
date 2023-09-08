# Copyright (c) 2012-2022, Mark Peek <mark@peek.org>
# All rights reserved.
#
# See LICENSE file for full license.
#
# *** Do not modify - this file is autogenerated ***


from . import AWSObject, AWSProperty, PropsDictType, Tags


class IamRole(AWSProperty):
    """
    `IamRole <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-accesspolicy-iamrole.html>`__
    """

    props: PropsDictType = {
        "arn": (str, False),
    }


class IamUser(AWSProperty):
    """
    `IamUser <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-accesspolicy-iamuser.html>`__
    """

    props: PropsDictType = {
        "arn": (str, False),
    }


class User(AWSProperty):
    """
    `User <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-accesspolicy-user.html>`__
    """

    props: PropsDictType = {
        "id": (str, False),
    }


class AccessPolicyIdentity(AWSProperty):
    """
    `AccessPolicyIdentity <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-accesspolicy-accesspolicyidentity.html>`__
    """

    props: PropsDictType = {
        "IamRole": (IamRole, False),
        "IamUser": (IamUser, False),
        "User": (User, False),
    }


class PortalProperty(AWSProperty):
    """
    `PortalProperty <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-accesspolicy-portal.html>`__
    """

    props: PropsDictType = {
        "id": (str, False),
    }


class ProjectProperty(AWSProperty):
    """
    `ProjectProperty <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-accesspolicy-project.html>`__
    """

    props: PropsDictType = {
        "id": (str, False),
    }


class AccessPolicyResource(AWSProperty):
    """
    `AccessPolicyResource <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-accesspolicy-accesspolicyresource.html>`__
    """

    props: PropsDictType = {
        "Portal": (PortalProperty, False),
        "Project": (ProjectProperty, False),
    }


class AccessPolicy(AWSObject):
    """
    `AccessPolicy <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iotsitewise-accesspolicy.html>`__
    """

    resource_type = "AWS::IoTSiteWise::AccessPolicy"

    props: PropsDictType = {
        "AccessPolicyIdentity": (AccessPolicyIdentity, True),
        "AccessPolicyPermission": (str, True),
        "AccessPolicyResource": (AccessPolicyResource, True),
    }


class AssetHierarchy(AWSProperty):
    """
    `AssetHierarchy <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-asset-assethierarchy.html>`__
    """

    props: PropsDictType = {
        "ChildAssetId": (str, True),
        "LogicalId": (str, True),
    }


class AssetProperty(AWSProperty):
    """
    `AssetProperty <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-asset-assetproperty.html>`__
    """

    props: PropsDictType = {
        "Alias": (str, False),
        "LogicalId": (str, True),
        "NotificationState": (str, False),
        "Unit": (str, False),
    }


class Asset(AWSObject):
    """
    `Asset <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iotsitewise-asset.html>`__
    """

    resource_type = "AWS::IoTSiteWise::Asset"

    props: PropsDictType = {
        "AssetDescription": (str, False),
        "AssetHierarchies": ([AssetHierarchy], False),
        "AssetModelId": (str, True),
        "AssetName": (str, True),
        "AssetProperties": ([AssetProperty], False),
        "Tags": (Tags, False),
    }


class Attribute(AWSProperty):
    """
    `Attribute <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-attribute.html>`__
    """

    props: PropsDictType = {
        "DefaultValue": (str, False),
    }


class VariableValue(AWSProperty):
    """
    `VariableValue <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-variablevalue.html>`__
    """

    props: PropsDictType = {
        "HierarchyLogicalId": (str, False),
        "PropertyLogicalId": (str, True),
    }


class ExpressionVariable(AWSProperty):
    """
    `ExpressionVariable <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-expressionvariable.html>`__
    """

    props: PropsDictType = {
        "Name": (str, True),
        "Value": (VariableValue, True),
    }


class TumblingWindow(AWSProperty):
    """
    `TumblingWindow <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-tumblingwindow.html>`__
    """

    props: PropsDictType = {
        "Interval": (str, True),
        "Offset": (str, False),
    }


class MetricWindow(AWSProperty):
    """
    `MetricWindow <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-metricwindow.html>`__
    """

    props: PropsDictType = {
        "Tumbling": (TumblingWindow, False),
    }


class Metric(AWSProperty):
    """
    `Metric <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-metric.html>`__
    """

    props: PropsDictType = {
        "Expression": (str, True),
        "Variables": ([ExpressionVariable], True),
        "Window": (MetricWindow, True),
    }


class Transform(AWSProperty):
    """
    `Transform <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-transform.html>`__
    """

    props: PropsDictType = {
        "Expression": (str, True),
        "Variables": ([ExpressionVariable], True),
    }


class PropertyType(AWSProperty):
    """
    `PropertyType <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-propertytype.html>`__
    """

    props: PropsDictType = {
        "Attribute": (Attribute, False),
        "Metric": (Metric, False),
        "Transform": (Transform, False),
        "TypeName": (str, True),
    }


class AssetModelProperty(AWSProperty):
    """
    `AssetModelProperty <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-assetmodelproperty.html>`__
    """

    props: PropsDictType = {
        "DataType": (str, True),
        "DataTypeSpec": (str, False),
        "LogicalId": (str, True),
        "Name": (str, True),
        "Type": (PropertyType, True),
        "Unit": (str, False),
    }


class AssetModelCompositeModel(AWSProperty):
    """
    `AssetModelCompositeModel <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-assetmodelcompositemodel.html>`__
    """

    props: PropsDictType = {
        "CompositeModelProperties": ([AssetModelProperty], False),
        "Description": (str, False),
        "Name": (str, True),
        "Type": (str, True),
    }


class AssetModelHierarchy(AWSProperty):
    """
    `AssetModelHierarchy <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-assetmodel-assetmodelhierarchy.html>`__
    """

    props: PropsDictType = {
        "ChildAssetModelId": (str, True),
        "LogicalId": (str, True),
        "Name": (str, True),
    }


class AssetModel(AWSObject):
    """
    `AssetModel <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iotsitewise-assetmodel.html>`__
    """

    resource_type = "AWS::IoTSiteWise::AssetModel"

    props: PropsDictType = {
        "AssetModelCompositeModels": ([AssetModelCompositeModel], False),
        "AssetModelDescription": (str, False),
        "AssetModelHierarchies": ([AssetModelHierarchy], False),
        "AssetModelName": (str, True),
        "AssetModelProperties": ([AssetModelProperty], False),
        "Tags": (Tags, False),
    }


class Dashboard(AWSObject):
    """
    `Dashboard <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iotsitewise-dashboard.html>`__
    """

    resource_type = "AWS::IoTSiteWise::Dashboard"

    props: PropsDictType = {
        "DashboardDefinition": (str, True),
        "DashboardDescription": (str, True),
        "DashboardName": (str, True),
        "ProjectId": (str, False),
        "Tags": (Tags, False),
    }


class GatewayCapabilitySummary(AWSProperty):
    """
    `GatewayCapabilitySummary <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-gateway-gatewaycapabilitysummary.html>`__
    """

    props: PropsDictType = {
        "CapabilityConfiguration": (str, False),
        "CapabilityNamespace": (str, True),
    }


class Greengrass(AWSProperty):
    """
    `Greengrass <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-gateway-greengrass.html>`__
    """

    props: PropsDictType = {
        "GroupArn": (str, True),
    }


class GreengrassV2(AWSProperty):
    """
    `GreengrassV2 <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-gateway-greengrassv2.html>`__
    """

    props: PropsDictType = {
        "CoreDeviceThingName": (str, True),
    }


class GatewayPlatform(AWSProperty):
    """
    `GatewayPlatform <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-gateway-gatewayplatform.html>`__
    """

    props: PropsDictType = {
        "Greengrass": (Greengrass, False),
        "GreengrassV2": (GreengrassV2, False),
    }


class Gateway(AWSObject):
    """
    `Gateway <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iotsitewise-gateway.html>`__
    """

    resource_type = "AWS::IoTSiteWise::Gateway"

    props: PropsDictType = {
        "GatewayCapabilitySummaries": ([GatewayCapabilitySummary], False),
        "GatewayName": (str, True),
        "GatewayPlatform": (GatewayPlatform, True),
        "Tags": (Tags, False),
    }


class Alarms(AWSProperty):
    """
    `Alarms <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iotsitewise-portal-alarms.html>`__
    """

    props: PropsDictType = {
        "AlarmRoleArn": (str, False),
        "NotificationLambdaArn": (str, False),
    }


class Portal(AWSObject):
    """
    `Portal <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iotsitewise-portal.html>`__
    """

    resource_type = "AWS::IoTSiteWise::Portal"

    props: PropsDictType = {
        "Alarms": (Alarms, False),
        "NotificationSenderEmail": (str, False),
        "PortalAuthMode": (str, False),
        "PortalContactEmail": (str, True),
        "PortalDescription": (str, False),
        "PortalName": (str, True),
        "RoleArn": (str, True),
        "Tags": (Tags, False),
    }


class Project(AWSObject):
    """
    `Project <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iotsitewise-project.html>`__
    """

    resource_type = "AWS::IoTSiteWise::Project"

    props: PropsDictType = {
        "AssetIds": ([str], False),
        "PortalId": (str, True),
        "ProjectDescription": (str, False),
        "ProjectName": (str, True),
        "Tags": (Tags, False),
    }