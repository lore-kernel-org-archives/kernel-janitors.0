From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 16 Oct 2019 18:14:35 +0000
Subject: [PATCH 02/10] cxl: remove unneeded conversions to bool
Message-Id: <20191016181443.24790-1-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/misc/cxl/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/sysfs.c b/drivers/misc/cxl/sysfs.c
index f0263d1a1fdf..c57ec87bc0a6 100644
--- a/drivers/misc/cxl/sysfs.c
+++ b/drivers/misc/cxl/sysfs.c
@@ -178,7 +178,7 @@ static ssize_t perst_reloads_same_image_store(struct device *device,
 	if ((rc != 1) || !(val = 1 || val = 0))
 		return -EINVAL;
 
-	adapter->perst_same_image = (val = 1 ? true : false);
+	adapter->perst_same_image = (val = 1);
 	return count;
 }
 
-- 
2.17.1
