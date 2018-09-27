From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 27 Sep 2018 06:45:06 +0000
Subject: [PATCH net-next] qed: Remove set but not used variable 'p_archipelago'
Message-Id: <1538030706-138186-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/qlogic/qed/qed_ooo.c: In function 'qed_ooo_delete_isles':
drivers/net/ethernet/qlogic/qed/qed_ooo.c:354:30: warning:
 variable 'p_archipelago' set but not used [-Wunused-but-set-variable]
 
drivers/net/ethernet/qlogic/qed/qed_ooo.c: In function 'qed_ooo_join_isles':
drivers/net/ethernet/qlogic/qed/qed_ooo.c:463:30: warning:
 variable 'p_archipelago' set but not used [-Wunused-but-set-variable]

Since commit 1eec2437d14c ("qed: Make OOO archipelagos into an array"),
'p_archipelago' is no longer in use.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/qlogic/qed/qed_ooo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_ooo.c b/drivers/net/ethernet/qlogic/qed/qed_ooo.c
index 63931df..ffac4ac 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_ooo.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_ooo.c
@@ -351,11 +351,9 @@ void qed_ooo_delete_isles(struct qed_hwfn *p_hwfn,
 			  struct qed_ooo_info *p_ooo_info,
 			  u32 cid, u8 drop_isle, u8 drop_size)
 {
-	struct qed_ooo_archipelago *p_archipelago = NULL;
 	struct qed_ooo_isle *p_isle = NULL;
 	u8 isle_idx;
 
-	p_archipelago = qed_ooo_seek_archipelago(p_hwfn, p_ooo_info, cid);
 	for (isle_idx = 0; isle_idx < drop_size; isle_idx++) {
 		p_isle = qed_ooo_seek_isle(p_hwfn, p_ooo_info, cid, drop_isle);
 		if (!p_isle) {
@@ -460,7 +458,6 @@ void qed_ooo_add_new_buffer(struct qed_hwfn *p_hwfn,
 void qed_ooo_join_isles(struct qed_hwfn *p_hwfn,
 			struct qed_ooo_info *p_ooo_info, u32 cid, u8 left_isle)
 {
-	struct qed_ooo_archipelago *p_archipelago = NULL;
 	struct qed_ooo_isle *p_right_isle = NULL;
 	struct qed_ooo_isle *p_left_isle = NULL;
 
@@ -473,7 +470,6 @@ void qed_ooo_join_isles(struct qed_hwfn *p_hwfn,
 		return;
 	}
 
-	p_archipelago = qed_ooo_seek_archipelago(p_hwfn, p_ooo_info, cid);
 	list_del(&p_right_isle->list_entry);
 	p_ooo_info->cur_isles_number--;
 	if (left_isle) {
