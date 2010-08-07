From: Dan Carpenter <error27@gmail.com>
Date: Sat, 07 Aug 2010 22:20:42 +0000
Subject: [patch] radeon: handle errors in radeon_hwmon_init()
Message-Id: <20100807222042.GE9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Matthew Garrett <mjg@redhat.com>

Smatch complained that the ERR_PTR from hwmon_device_register() wasn't
handled.  I added some error handling in radeon_hwmon_init() to silence
the warning.

Unfortunately errors from radeon_pm_init() aren't handled so this
doesn't really make a difference beyond silencing the warning.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index 95f8b3a..965e0f1 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -472,9 +472,9 @@ static const struct attribute_group hwmon_attrgroup = {
 	.attrs = hwmon_attributes,
 };
 
-static void radeon_hwmon_init(struct radeon_device *rdev)
+static int radeon_hwmon_init(struct radeon_device *rdev)
 {
-	int err;
+	int err = 0;
 
 	rdev->pm.int_hwmon_dev = NULL;
 
@@ -483,15 +483,24 @@ static void radeon_hwmon_init(struct radeon_device *rdev)
 	case THERMAL_TYPE_RV770:
 	case THERMAL_TYPE_EVERGREEN:
 		rdev->pm.int_hwmon_dev = hwmon_device_register(rdev->dev);
+		if (IS_ERR(rdev->pm.int_hwmon_dev)) {
+			err = PTR_ERR(rdev->pm.int_hwmon_dev);
+			DRM_ERROR("Unable to register hwmon device: %d\n", err);
+			break;
+		}
 		dev_set_drvdata(rdev->pm.int_hwmon_dev, rdev->ddev);
 		err = sysfs_create_group(&rdev->pm.int_hwmon_dev->kobj,
 					 &hwmon_attrgroup);
-		if (err)
+		if (err) {
 			DRM_ERROR("Unable to create hwmon sysfs file: %d\n", err);
+			hwmon_device_unregister(rdev->dev);
+		}
 		break;
 	default:
 		break;
 	}
+
+	return err;
 }
 
 static void radeon_hwmon_fini(struct radeon_device *rdev)
@@ -540,6 +549,7 @@ void radeon_pm_resume(struct radeon_device *rdev)
 int radeon_pm_init(struct radeon_device *rdev)
 {
 	int ret;
+
 	/* default to profile method */
 	rdev->pm.pm_method = PM_METHOD_PROFILE;
 	rdev->pm.profile = PM_PROFILE_DEFAULT;
@@ -561,7 +571,9 @@ int radeon_pm_init(struct radeon_device *rdev)
 	}
 
 	/* set up the internal thermal sensor if applicable */
-	radeon_hwmon_init(rdev);
+	ret = radeon_hwmon_init(rdev);
+	if (ret)
+		return ret;
 	if (rdev->pm.num_power_states > 1) {
 		/* where's the best place to put these? */
 		ret = device_create_file(rdev->dev, &dev_attr_power_profile);
