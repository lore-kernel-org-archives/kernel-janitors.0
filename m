From: Colin King <colin.king@canonical.com>
Date: Tue, 26 Sep 2017 15:14:09 +0000
Subject: [PATCH][next] cxgb4: make function ch_flower_stats_cb, fixes warning
Message-Id: <20170926151409.18244-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ganesh Goudar <ganeshgr@chelsio.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function ch_flower_stats_cb is local to the source and does not need
to be in global scope, so make it static.

Cleans up sparse warnings:
symbol 'ch_flower_stats_cb' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
index a36bd66d2834..92a311767381 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
@@ -366,7 +366,7 @@ int cxgb4_tc_flower_destroy(struct net_device *dev,
 	return ret;
 }
 
-void ch_flower_stats_cb(unsigned long data)
+static void ch_flower_stats_cb(unsigned long data)
 {
 	struct adapter *adap = (struct adapter *)data;
 	struct ch_tc_flower_entry *flower_entry;
-- 
2.14.1

