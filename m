From: Colin King <colin.king@canonical.com>
Date: Fri, 10 May 2019 09:58:32 +0000
Subject: [PATCH][V2] reset: remove redundant null check on pointer dev
Message-Id: <20190510095832.28233-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer dev is being dereferenced when passed to the inlined
functon dev_name, however, dev is later being null checked
so at first this seems like a potential null pointer dereference.

In fact, _reset_control_get_from_lookup is only ever called from
__reset_control_get, right after checking dev->of_node hence
dev can never be null.  Clean this up by removing the redundant
null check.

Thanks to Philipp Zabel for spotting that dev can never be null.

Addresses-Coverity: ("Dereference before null check")
Fixes: 6691dffab0ab ("reset: add support for non-DT systems")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: remove null check point, it is redundant.

---
 drivers/reset/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 81ea77cba123..921f4bbbad8a 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -694,9 +694,6 @@ __reset_control_get_from_lookup(struct device *dev, const char *con_id,
 	const char *dev_id = dev_name(dev);
 	struct reset_control *rstc = NULL;
 
-	if (!dev)
-		return ERR_PTR(-EINVAL);
-
 	mutex_lock(&reset_lookup_mutex);
 
 	list_for_each_entry(lookup, &reset_lookup_list, list) {
-- 
2.20.1
