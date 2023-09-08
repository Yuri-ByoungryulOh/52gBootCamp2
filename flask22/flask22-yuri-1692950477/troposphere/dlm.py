# Copyright (c) 2012-2022, Mark Peek <mark@peek.org>
# All rights reserved.
#
# See LICENSE file for full license.
#
# *** Do not modify - this file is autogenerated ***


from . import AWSObject, AWSProperty, PropsDictType, Tags
from .validators import boolean, integer
from .validators.dlm import (
    validate_interval,
    validate_interval_unit,
    validate_state,
    validate_tags_or_list,
)


class CrossRegionCopyRetainRule(AWSProperty):
    """
    `CrossRegionCopyRetainRule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-crossregioncopyretainrule.html>`__
    """

    props: PropsDictType = {
        "Interval": (integer, True),
        "IntervalUnit": (str, True),
    }


class EncryptionConfiguration(AWSProperty):
    """
    `EncryptionConfiguration <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-encryptionconfiguration.html>`__
    """

    props: PropsDictType = {
        "CmkArn": (str, False),
        "Encrypted": (boolean, True),
    }


class CrossRegionCopyAction(AWSProperty):
    """
    `CrossRegionCopyAction <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-crossregioncopyaction.html>`__
    """

    props: PropsDictType = {
        "EncryptionConfiguration": (EncryptionConfiguration, True),
        "RetainRule": (CrossRegionCopyRetainRule, False),
        "Target": (str, True),
    }


class Action(AWSProperty):
    """
    `Action <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-action.html>`__
    """

    props: PropsDictType = {
        "CrossRegionCopy": ([CrossRegionCopyAction], True),
        "Name": (str, True),
    }


class EventParameters(AWSProperty):
    """
    `EventParameters <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-eventparameters.html>`__
    """

    props: PropsDictType = {
        "DescriptionRegex": (str, False),
        "EventType": (str, True),
        "SnapshotOwner": ([str], True),
    }


class EventSource(AWSProperty):
    """
    `EventSource <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-eventsource.html>`__
    """

    props: PropsDictType = {
        "Parameters": (EventParameters, False),
        "Type": (str, True),
    }


class Parameters(AWSProperty):
    """
    `Parameters <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-parameters.html>`__
    """

    props: PropsDictType = {
        "ExcludeBootVolume": (boolean, False),
        "ExcludeDataVolumeTags": (Tags, False),
        "NoReboot": (boolean, False),
    }


class RetentionArchiveTier(AWSProperty):
    """
    `RetentionArchiveTier <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-retentionarchivetier.html>`__
    """

    props: PropsDictType = {
        "Count": (integer, False),
        "Interval": (integer, False),
        "IntervalUnit": (str, False),
    }


class ArchiveRetainRule(AWSProperty):
    """
    `ArchiveRetainRule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-archiveretainrule.html>`__
    """

    props: PropsDictType = {
        "RetentionArchiveTier": (RetentionArchiveTier, True),
    }


class ArchiveRule(AWSProperty):
    """
    `ArchiveRule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-archiverule.html>`__
    """

    props: PropsDictType = {
        "RetainRule": (ArchiveRetainRule, True),
    }


class CreateRule(AWSProperty):
    """
    `CreateRule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-createrule.html>`__
    """

    props: PropsDictType = {
        "CronExpression": (str, False),
        "Interval": (validate_interval, False),
        "IntervalUnit": (validate_interval_unit, False),
        "Location": (str, False),
        "Times": ([str], False),
    }


class CrossRegionCopyDeprecateRule(AWSProperty):
    """
    `CrossRegionCopyDeprecateRule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-crossregioncopydeprecaterule.html>`__
    """

    props: PropsDictType = {
        "Interval": (integer, True),
        "IntervalUnit": (str, True),
    }


class CrossRegionCopyRule(AWSProperty):
    """
    `CrossRegionCopyRule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-crossregioncopyrule.html>`__
    """

    props: PropsDictType = {
        "CmkArn": (str, False),
        "CopyTags": (boolean, False),
        "DeprecateRule": (CrossRegionCopyDeprecateRule, False),
        "Encrypted": (boolean, True),
        "RetainRule": (CrossRegionCopyRetainRule, False),
        "Target": (str, False),
        "TargetRegion": (str, False),
    }


class DeprecateRule(AWSProperty):
    """
    `DeprecateRule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-deprecaterule.html>`__
    """

    props: PropsDictType = {
        "Count": (integer, False),
        "Interval": (integer, False),
        "IntervalUnit": (str, False),
    }


class FastRestoreRule(AWSProperty):
    """
    `FastRestoreRule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-fastrestorerule.html>`__
    """

    props: PropsDictType = {
        "AvailabilityZones": ([str], False),
        "Count": (integer, False),
        "Interval": (integer, False),
        "IntervalUnit": (str, False),
    }


class RetainRule(AWSProperty):
    """
    `RetainRule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-retainrule.html>`__
    """

    props: PropsDictType = {
        "Count": (integer, False),
        "Interval": (integer, False),
        "IntervalUnit": (str, False),
    }


class ShareRule(AWSProperty):
    """
    `ShareRule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-sharerule.html>`__
    """

    props: PropsDictType = {
        "TargetAccounts": ([str], False),
        "UnshareInterval": (integer, False),
        "UnshareIntervalUnit": (str, False),
    }


class Schedule(AWSProperty):
    """
    `Schedule <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-schedule.html>`__
    """

    props: PropsDictType = {
        "ArchiveRule": (ArchiveRule, False),
        "CopyTags": (boolean, False),
        "CreateRule": (CreateRule, False),
        "CrossRegionCopyRules": ([CrossRegionCopyRule], False),
        "DeprecateRule": (DeprecateRule, False),
        "FastRestoreRule": (FastRestoreRule, False),
        "Name": (str, False),
        "RetainRule": (RetainRule, False),
        "ShareRules": ([ShareRule], False),
        "TagsToAdd": (validate_tags_or_list, False),
        "VariableTags": (Tags, False),
    }


class PolicyDetails(AWSProperty):
    """
    `PolicyDetails <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-dlm-lifecyclepolicy-policydetails.html>`__
    """

    props: PropsDictType = {
        "Actions": ([Action], False),
        "EventSource": (EventSource, False),
        "Parameters": (Parameters, False),
        "PolicyType": (str, False),
        "ResourceLocations": ([str], False),
        "ResourceTypes": ([str], False),
        "Schedules": ([Schedule], False),
        "TargetTags": (validate_tags_or_list, False),
    }


class LifecyclePolicy(AWSObject):
    """
    `LifecyclePolicy <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-dlm-lifecyclepolicy.html>`__
    """

    resource_type = "AWS::DLM::LifecyclePolicy"

    props: PropsDictType = {
        "Description": (str, False),
        "ExecutionRoleArn": (str, False),
        "PolicyDetails": (PolicyDetails, False),
        "State": (validate_state, False),
        "Tags": (validate_tags_or_list, False),
    }