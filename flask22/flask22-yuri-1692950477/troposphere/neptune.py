# Copyright (c) 2012-2022, Mark Peek <mark@peek.org>
# All rights reserved.
#
# See LICENSE file for full license.
#
# *** Do not modify - this file is autogenerated ***


from . import AWSObject, AWSProperty, PropsDictType, Tags
from .validators import boolean, double, integer


class DBClusterRole(AWSProperty):
    """
    `DBClusterRole <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-neptune-dbcluster-dbclusterrole.html>`__
    """

    props: PropsDictType = {
        "FeatureName": (str, False),
        "RoleArn": (str, True),
    }


class ServerlessScalingConfiguration(AWSProperty):
    """
    `ServerlessScalingConfiguration <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-neptune-dbcluster-serverlessscalingconfiguration.html>`__
    """

    props: PropsDictType = {
        "MaxCapacity": (double, True),
        "MinCapacity": (double, True),
    }


class DBCluster(AWSObject):
    """
    `DBCluster <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-neptune-dbcluster.html>`__
    """

    resource_type = "AWS::Neptune::DBCluster"

    props: PropsDictType = {
        "AssociatedRoles": ([DBClusterRole], False),
        "AvailabilityZones": ([str], False),
        "BackupRetentionPeriod": (integer, False),
        "CopyTagsToSnapshot": (boolean, False),
        "DBClusterIdentifier": (str, False),
        "DBClusterParameterGroupName": (str, False),
        "DBInstanceParameterGroupName": (str, False),
        "DBPort": (integer, False),
        "DBSubnetGroupName": (str, False),
        "DeletionProtection": (boolean, False),
        "EnableCloudwatchLogsExports": ([str], False),
        "EngineVersion": (str, False),
        "IamAuthEnabled": (boolean, False),
        "KmsKeyId": (str, False),
        "PreferredBackupWindow": (str, False),
        "PreferredMaintenanceWindow": (str, False),
        "RestoreToTime": (str, False),
        "RestoreType": (str, False),
        "ServerlessScalingConfiguration": (ServerlessScalingConfiguration, False),
        "SnapshotIdentifier": (str, False),
        "SourceDBClusterIdentifier": (str, False),
        "StorageEncrypted": (boolean, False),
        "Tags": (Tags, False),
        "UseLatestRestorableTime": (boolean, False),
        "VpcSecurityGroupIds": ([str], False),
    }


class DBClusterParameterGroup(AWSObject):
    """
    `DBClusterParameterGroup <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-neptune-dbclusterparametergroup.html>`__
    """

    resource_type = "AWS::Neptune::DBClusterParameterGroup"

    props: PropsDictType = {
        "Description": (str, True),
        "Family": (str, True),
        "Name": (str, False),
        "Parameters": (dict, True),
        "Tags": (Tags, False),
    }


class DBInstance(AWSObject):
    """
    `DBInstance <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-neptune-dbinstance.html>`__
    """

    resource_type = "AWS::Neptune::DBInstance"

    props: PropsDictType = {
        "AllowMajorVersionUpgrade": (boolean, False),
        "AutoMinorVersionUpgrade": (boolean, False),
        "AvailabilityZone": (str, False),
        "DBClusterIdentifier": (str, False),
        "DBInstanceClass": (str, True),
        "DBInstanceIdentifier": (str, False),
        "DBParameterGroupName": (str, False),
        "DBSnapshotIdentifier": (str, False),
        "DBSubnetGroupName": (str, False),
        "PreferredMaintenanceWindow": (str, False),
        "Tags": (Tags, False),
    }


class DBParameterGroup(AWSObject):
    """
    `DBParameterGroup <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-neptune-dbparametergroup.html>`__
    """

    resource_type = "AWS::Neptune::DBParameterGroup"

    props: PropsDictType = {
        "Description": (str, True),
        "Family": (str, True),
        "Name": (str, False),
        "Parameters": (dict, True),
        "Tags": (Tags, False),
    }


class DBSubnetGroup(AWSObject):
    """
    `DBSubnetGroup <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-neptune-dbsubnetgroup.html>`__
    """

    resource_type = "AWS::Neptune::DBSubnetGroup"

    props: PropsDictType = {
        "DBSubnetGroupDescription": (str, True),
        "DBSubnetGroupName": (str, False),
        "SubnetIds": ([str], True),
        "Tags": (Tags, False),
    }