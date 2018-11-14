From: Colin King <colin.king@canonical.com>
Date: Wed, 14 Nov 2018 21:49:35 +0000
Subject: [PATCH][next] reset: fix null pointer dereference on dev by dev_name
Message-Id: <20181114214935.16038-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to dev_name will dereference dev, however, dev is later
being null checked, so there is a possibility of a null pointer
dereference on dev by the call to dev_name. Fix this by null
checking dev first before the call to dev_name

Detected by CoverityScan, CID#1475475 ("Dereference before null check")

Fixes: 2a6cb2b1d83b ("reset: Add reset_control_get_count()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/reset/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 7f95fcb7805d..3d9a887c217e 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -799,12 +799,13 @@ EXPORT_SYMBOL_GPL(devm_reset_control_array_get);
 static int reset_control_get_count_from_lookup(struct device *dev)
 {
 	const struct reset_control_lookup *lookup;
-	const char *dev_id = dev_name(dev);
+	const char *dev_id;
 	int count = 0;
 
 	if (!dev)
 		return -EINVAL;
 
+	dev_id = dev_name(dev);
 	mutex_lock(&reset_lookup_mutex);
 
 	list_for_each_entry(lookup, &reset_lookup_list, list) {
-- 
2.19.1
