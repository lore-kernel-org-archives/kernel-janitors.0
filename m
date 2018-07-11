From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2018 08:02:28 +0000
Subject: [PATCH] drm/nouveau/hwmon: potential uninitialized variables
Message-Id: <20180711080223.jktfeb4ofhqsv47a@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Smatch complains that "value" can be uninitialized when kstrtol()
returns -ERANGE.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 44178b4c3599..08a1ab6b150d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -69,8 +69,8 @@ nouveau_hwmon_set_temp1_auto_point1_temp(struct device *d,
 	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
 	long value;
 
-	if (kstrtol(buf, 10, &value) = -EINVAL)
-		return count;
+	if (kstrtol(buf, 10, &value))
+		return -EINVAL;
 
 	therm->attr_set(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST,
 			value / 1000);
@@ -102,8 +102,8 @@ nouveau_hwmon_set_temp1_auto_point1_temp_hyst(struct device *d,
 	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
 	long value;
 
-	if (kstrtol(buf, 10, &value) = -EINVAL)
-		return count;
+	if (kstrtol(buf, 10, &value))
+		return -EINVAL;
 
 	therm->attr_set(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST,
 			value / 1000);
@@ -156,7 +156,7 @@ nouveau_hwmon_set_pwm1_min(struct device *d, struct device_attribute *a,
 	long value;
 	int ret;
 
-	if (kstrtol(buf, 10, &value) = -EINVAL)
+	if (kstrtol(buf, 10, &value))
 		return -EINVAL;
 
 	ret = therm->attr_set(therm, NVKM_THERM_ATTR_FAN_MIN_DUTY, value);
@@ -179,7 +179,7 @@ nouveau_hwmon_set_pwm1_max(struct device *d, struct device_attribute *a,
 	long value;
 	int ret;
 
-	if (kstrtol(buf, 10, &value) = -EINVAL)
+	if (kstrtol(buf, 10, &value))
 		return -EINVAL;
 
 	ret = therm->attr_set(therm, NVKM_THERM_ATTR_FAN_MAX_DUTY, value);
