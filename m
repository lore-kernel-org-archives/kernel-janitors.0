From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 11:00:08 +0000
Subject: [PATCH] libnvdimm/namespace: Fix a signedness bug in __holder_class_store()
Message-Id: <20190925110008.GK3264@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>
Cc: linux-nvdimm@lists.01.org, kernel-janitors@vger.kernel.org

The "ndns->claim_class" variable is an enum but in this case GCC will
treat it as an unsigned int so the error handling is never triggered.

Fixes: 14e494542636 ("libnvdimm, btt: BTT updates for UEFI 2.7 format")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/nvdimm/namespace_devs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index cca0a3ba1d2c..669985527716 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -1529,7 +1529,7 @@ static ssize_t __holder_class_store(struct device *dev, const char *buf)
 		return -EINVAL;
 
 	/* btt_claim_class() could've returned an error */
-	if (ndns->claim_class < 0)
+	if ((int)ndns->claim_class < 0)
 		return ndns->claim_class;
 
 	return 0;
-- 
2.20.1
