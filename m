From: ira.weiny@intel.com
Date: Wed, 25 Sep 2019 18:10:56 +0000
Subject: [PATCH] bnvdimm/namsepace: Don't set claim_class on error
Message-Id: <20190925181056.11097-1-ira.weiny@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-nvdimm@lists.01.org

From: Ira Weiny <ira.weiny@intel.com>

Don't leave claim_class set to an invalid value if an error occurs in
btt_claim_class().

While we are here change the return type of __holder_class_store() to be
clear about the values it is returning.

This was found via code inspection.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/nvdimm/namespace_devs.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index 5b22cecefc99..a020c166e1e7 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -1510,16 +1510,19 @@ static ssize_t holder_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(holder);
 
-static ssize_t __holder_class_store(struct device *dev, const char *buf)
+static int __holder_class_store(struct device *dev, const char *buf)
 {
 	struct nd_namespace_common *ndns = to_ndns(dev);
 
 	if (dev->driver || ndns->claim)
 		return -EBUSY;
 
-	if (sysfs_streq(buf, "btt"))
-		ndns->claim_class = btt_claim_class(dev);
-	else if (sysfs_streq(buf, "pfn"))
+	if (sysfs_streq(buf, "btt")) {
+		int rc = btt_claim_class(dev);
+		if (rc < NVDIMM_CCLASS_NONE)
+			return rc;
+		ndns->claim_class = rc;
+	} else if (sysfs_streq(buf, "pfn"))
 		ndns->claim_class = NVDIMM_CCLASS_PFN;
 	else if (sysfs_streq(buf, "dax"))
 		ndns->claim_class = NVDIMM_CCLASS_DAX;
@@ -1528,10 +1531,6 @@ static ssize_t __holder_class_store(struct device *dev, const char *buf)
 	else
 		return -EINVAL;
 
-	/* btt_claim_class() could've returned an error */
-	if ((int)ndns->claim_class < 0)
-		return ndns->claim_class;
-
 	return 0;
 }
 
@@ -1539,7 +1538,7 @@ static ssize_t holder_class_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t len)
 {
 	struct nd_region *nd_region = to_nd_region(dev->parent);
-	ssize_t rc;
+	int rc;
 
 	nd_device_lock(dev);
 	nvdimm_bus_lock(dev);
@@ -1547,7 +1546,7 @@ static ssize_t holder_class_store(struct device *dev,
 	rc = __holder_class_store(dev, buf);
 	if (rc >= 0)
 		rc = nd_namespace_label_update(nd_region, dev);
-	dev_dbg(dev, "%s(%zd)\n", rc < 0 ? "fail " : "", rc);
+	dev_dbg(dev, "%s(%d)\n", rc < 0 ? "fail " : "", rc);
 	nvdimm_bus_unlock(dev);
 	nd_device_unlock(dev);
 
-- 
2.20.1
