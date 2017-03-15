From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:14 +0000
Subject: [PATCH 06/14] cxl: remove unneeded conversions to bool
Message-Id: <20170315162322.12096-6-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/misc/cxl/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/sysfs.c b/drivers/misc/cxl/sysfs.c
index a8b6d6a635e9..64c600e6c045 100644
--- a/drivers/misc/cxl/sysfs.c
+++ b/drivers/misc/cxl/sysfs.c
@@ -161,7 +161,7 @@ static ssize_t perst_reloads_same_image_store(struct device *device,
 	if ((rc != 1) || !(val = 1 || val = 0))
 		return -EINVAL;
 
-	adapter->perst_same_image = (val = 1 ? true : false);
+	adapter->perst_same_image = (val = 1);
 	return count;
 }
 
-- 
2.11.0

