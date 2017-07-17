From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Jul 2017 08:17:11 +0000
Subject: [PATCH] drm/nouveau/hwmon: Uninitialized variables in sysfs
Message-Id: <20170717081711.4mj76r6qf2de4em6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

kstrtol() and friends can return -EINVAL or -ERANGE.  We have to test
for both, otherwise the value is possibly uninitialized.  Also in some
of these files we accidentally return "count" on error instead of a
negative error code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 7c965648df80..5e75af91c446 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -68,9 +68,11 @@ nouveau_hwmon_set_temp1_auto_point1_temp(struct device *d,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
 	long value;
+	int ret;
 
-	if (kstrtol(buf, 10, &value) = -EINVAL)
-		return count;
+	ret = kstrtol(buf, 10, &value);
+	if (ret)
+		return ret;
 
 	therm->attr_set(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST,
 			value / 1000);
@@ -101,9 +103,11 @@ nouveau_hwmon_set_temp1_auto_point1_temp_hyst(struct device *d,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
 	long value;
+	int ret;
 
-	if (kstrtol(buf, 10, &value) = -EINVAL)
-		return count;
+	ret = kstrtol(buf, 10, &value);
+	if (ret)
+		return ret;
 
 	therm->attr_set(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST,
 			value / 1000);
@@ -156,8 +160,9 @@ nouveau_hwmon_set_pwm1_min(struct device *d, struct device_attribute *a,
 	long value;
 	int ret;
 
-	if (kstrtol(buf, 10, &value) = -EINVAL)
-		return -EINVAL;
+	ret = kstrtol(buf, 10, &value);
+	if (ret)
+		return ret;
 
 	ret = therm->attr_set(therm, NVKM_THERM_ATTR_FAN_MIN_DUTY, value);
 	if (ret < 0)
@@ -179,8 +184,9 @@ nouveau_hwmon_set_pwm1_max(struct device *d, struct device_attribute *a,
 	long value;
 	int ret;
 
-	if (kstrtol(buf, 10, &value) = -EINVAL)
-		return -EINVAL;
+	ret = kstrtol(buf, 10, &value);
+	if (ret)
+		return ret;
 
 	ret = therm->attr_set(therm, NVKM_THERM_ATTR_FAN_MAX_DUTY, value);
 	if (ret < 0)
