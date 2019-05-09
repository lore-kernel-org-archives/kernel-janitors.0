From: Colin King <colin.king@canonical.com>
Date: Thu, 09 May 2019 16:00:36 +0000
Subject: [PATCH] reset: fix potential null pointer dereference on pointer dev
Message-Id: <20190509160036.19433-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer dev is being dereferenced when passed to the inlined
functon dev_name, however, dev is later being null checked.
Thus there is a potential null pointer dereference on a null
dev. Fix this by performing the null check on dev before
dereferencing it.

Addresses-Coverity: ("Dereference before null check")
Fixes: 6691dffab0ab ("reset: add support for non-DT systems")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/reset/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 81ea77cba123..83f1a1d5ee67 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -691,12 +691,13 @@ __reset_control_get_from_lookup(struct device *dev, const char *con_id,
 {
 	const struct reset_control_lookup *lookup;
 	struct reset_controller_dev *rcdev;
-	const char *dev_id = dev_name(dev);
+	const char *dev_id;
 	struct reset_control *rstc = NULL;
 
 	if (!dev)
 		return ERR_PTR(-EINVAL);
 
+	dev_id = dev_name(dev);
 	mutex_lock(&reset_lookup_mutex);
 
 	list_for_each_entry(lookup, &reset_lookup_list, list) {
-- 
2.20.1
