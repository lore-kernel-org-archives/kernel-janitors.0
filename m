From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Feb 2014 09:29:43 +0000
Subject: [patch] drm/nouveau/hwmon: remove some redundant checks
Message-Id: <20140206092942.GC31780@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Martin Peres <martin.peres@labri.fr>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>

No need to check "ret" twice in a row.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 4aff04fa483c..5e4ab58f4f6b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -587,18 +587,14 @@ nouveau_hwmon_init(struct drm_device *dev)
 
 	/* set the default attributes */
 	ret = sysfs_create_group(&hwmon_dev->kobj, &hwmon_default_attrgroup);
-	if (ret) {
-		if (ret)
-			goto error;
-	}
+	if (ret)
+		goto error;
 
 	/* if the card has a working thermal sensor */
 	if (therm->temp_get(therm) >= 0) {
 		ret = sysfs_create_group(&hwmon_dev->kobj, &hwmon_temp_attrgroup);
-		if (ret) {
-			if (ret)
-				goto error;
-		}
+		if (ret)
+			goto error;
 	}
 
 	/* if the card has a pwm fan */
