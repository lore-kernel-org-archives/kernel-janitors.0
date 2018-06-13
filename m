From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 13 Jun 2018 04:48:09 +0000
Subject: [PATCH] mfd: kempld-core: constify variables that point to const structure
Message-Id: <1528865289-3875-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Add const to the declaration of various local variables of type
kempld_platform_data for which the referenced value is always only
dereferenced or passed to a const parameter, to record the fact that
kempld_platform_data_generic is declared as const.

The semantic match that finds this issue is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier i,j;
@@
const struct i j = { ... };

@ok@
identifier r.i;
position p;
@@
const struct i@p *

@@
identifier r.i;
position p != ok.p;
@@
* struct i@p *
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mfd/kempld-core.c |   15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 390b27c..fb5a10b 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -143,7 +143,7 @@ static int kempld_register_cells_generic(struct kempld_device_data *pld)
 
 static int kempld_create_platform_device(const struct dmi_system_id *id)
 {
-	struct kempld_platform_data *pdata = id->driver_data;
+	const struct kempld_platform_data *pdata = id->driver_data;
 	int ret;
 
 	kempld_pdev = platform_device_alloc("kempld", -1);
@@ -259,7 +259,7 @@ void kempld_write32(struct kempld_device_data *pld, u8 index, u32 data)
  */
 void kempld_get_mutex(struct kempld_device_data *pld)
 {
-	struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
+	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 
 	mutex_lock(&pld->lock);
 	pdata->get_hardware_mutex(pld);
@@ -272,7 +272,7 @@ void kempld_get_mutex(struct kempld_device_data *pld)
  */
 void kempld_release_mutex(struct kempld_device_data *pld)
 {
-	struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
+	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 
 	pdata->release_hardware_mutex(pld);
 	mutex_unlock(&pld->lock);
@@ -290,7 +290,7 @@ void kempld_release_mutex(struct kempld_device_data *pld)
 static int kempld_get_info(struct kempld_device_data *pld)
 {
 	int ret;
-	struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
+	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 	char major, minor;
 
 	ret = pdata->get_info(pld);
@@ -332,7 +332,7 @@ static int kempld_get_info(struct kempld_device_data *pld)
  */
 static int kempld_register_cells(struct kempld_device_data *pld)
 {
-	struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
+	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 
 	return pdata->register_cells(pld);
 }
@@ -444,7 +444,8 @@ static int kempld_detect_device(struct kempld_device_data *pld)
 
 static int kempld_probe(struct platform_device *pdev)
 {
-	struct kempld_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	const struct kempld_platform_data *pdata +		dev_get_platdata(&pdev->dev);
 	struct device *dev = &pdev->dev;
 	struct kempld_device_data *pld;
 	struct resource *ioport;
@@ -476,7 +477,7 @@ static int kempld_probe(struct platform_device *pdev)
 static int kempld_remove(struct platform_device *pdev)
 {
 	struct kempld_device_data *pld = platform_get_drvdata(pdev);
-	struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
+	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 
 	sysfs_remove_group(&pld->dev->kobj, &pld_attr_group);
 

