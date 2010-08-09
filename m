From: Dan Carpenter <error27@gmail.com>
Date: Mon, 09 Aug 2010 19:59:42 +0000
Subject: [patch v2] radeon: handle errors in radeon_hwmon_init()
Message-Id: <20100809195941.GK9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100807222042.GE9031@bicker>
	<AANLkTi=ypWxuTiAZgYBi4s=Kda8eeihm7p4u0qQBy0Su@mail.gmail.com>
In-Reply-To: <AANLkTi=ypWxuTiAZgYBi4s=Kda8eeihm7p4u0qQBy0Su@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Matthew Garrett <mjg@redhat.com>

Smatch complained that the ERR_PTR from hwmon_device_register() wasn't
handled. =A0I added some error handling in radeon_hwmon_init() to silence
the warning.

Unfortunately errors from radeon_pm_init() aren't handled so this
doesn't really make a difference beyond silencing the warning.

Also I changed DRM_ERROR() to dev_err() which is the new preferred
method.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
V2:  switched from DRM_ERROR() to dev_err()

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/ra=
deon_pm.c
index 95f8b3a..58038f5 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -472,9 +472,9 @@ static const struct attribute_group hwmon_attrgroup =3D=
 {
 	.attrs =3D hwmon_attributes,
 };
=20
-static void radeon_hwmon_init(struct radeon_device *rdev)
+static int radeon_hwmon_init(struct radeon_device *rdev)
 {
-	int err;
+	int err =3D 0;
=20
 	rdev->pm.int_hwmon_dev =3D NULL;
=20
@@ -483,15 +483,26 @@ static void radeon_hwmon_init(struct radeon_device *r=
dev)
 	case THERMAL_TYPE_RV770:
 	case THERMAL_TYPE_EVERGREEN:
 		rdev->pm.int_hwmon_dev =3D hwmon_device_register(rdev->dev);
+		if (IS_ERR(rdev->pm.int_hwmon_dev)) {
+			err =3D PTR_ERR(rdev->pm.int_hwmon_dev);
+			dev_err(rdev->dev,
+				"Unable to register hwmon device: %d\n", err);
+			break;
+		}
 		dev_set_drvdata(rdev->pm.int_hwmon_dev, rdev->ddev);
 		err =3D sysfs_create_group(&rdev->pm.int_hwmon_dev->kobj,
 					 &hwmon_attrgroup);
-		if (err)
-			DRM_ERROR("Unable to create hwmon sysfs file: %d\n", err);
+		if (err) {
+			dev_err(rdev->dev,
+				"Unable to create hwmon sysfs file: %d\n", err);
+			hwmon_device_unregister(rdev->dev);
+		}
 		break;
 	default:
 		break;
 	}
+
+	return err;
 }
=20
 static void radeon_hwmon_fini(struct radeon_device *rdev)
@@ -540,6 +551,7 @@ void radeon_pm_resume(struct radeon_device *rdev)
 int radeon_pm_init(struct radeon_device *rdev)
 {
 	int ret;
+
 	/* default to profile method */
 	rdev->pm.pm_method =3D PM_METHOD_PROFILE;
 	rdev->pm.profile =3D PM_PROFILE_DEFAULT;
@@ -561,7 +573,9 @@ int radeon_pm_init(struct radeon_device *rdev)
 	}
=20
 	/* set up the internal thermal sensor if applicable */
-	radeon_hwmon_init(rdev);
+	ret =3D radeon_hwmon_init(rdev);
+	if (ret)
+		return ret;
 	if (rdev->pm.num_power_states > 1) {
 		/* where's the best place to put these? */
 		ret =3D device_create_file(rdev->dev, &dev_attr_power_profile);
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
