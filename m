From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:05:45 +0000
Subject: [PATCH 15/61] gpu: drm: omapdrm: displays: simplify getting .drvdata
Message-Id: <20180419140641.27926-16-wsa+renesas@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 428de90fced1..8f8573a00e07 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -412,8 +412,7 @@ static const struct backlight_ops dsicm_bl_ops = {
 static ssize_t dsicm_num_errors_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	struct omap_dss_device *in = ddata->in;
 	u8 errors = 0;
 	int r;
@@ -444,8 +443,7 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
 static ssize_t dsicm_hw_revision_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	struct omap_dss_device *in = ddata->in;
 	u8 id1, id2, id3;
 	int r;
@@ -476,8 +474,7 @@ static ssize_t dsicm_store_ulps(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t count)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	struct omap_dss_device *in = ddata->in;
 	unsigned long t;
 	int r;
@@ -511,8 +508,7 @@ static ssize_t dsicm_show_ulps(struct device *dev,
 		struct device_attribute *attr,
 		char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	unsigned int t;
 
 	mutex_lock(&ddata->lock);
@@ -526,8 +522,7 @@ static ssize_t dsicm_store_ulps_timeout(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t count)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	struct omap_dss_device *in = ddata->in;
 	unsigned long t;
 	int r;
@@ -558,8 +553,7 @@ static ssize_t dsicm_show_ulps_timeout(struct device *dev,
 		struct device_attribute *attr,
 		char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	unsigned int t;
 
 	mutex_lock(&ddata->lock);
-- 
2.11.0

