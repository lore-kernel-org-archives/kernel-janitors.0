From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Sep 2019 09:07:59 +0000
Subject: [PATCH] qed: fix spelling mistake "fullill" -> "fulfill"
Message-Id: <20190913090759.3490-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DP_VERBOSE debug message. Fix it.
(Using American English spelling as this is the most common way
to spell this in the kernel).

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_vf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_vf.c b/drivers/net/ethernet/qlogic/qed/qed_vf.c
index 5dda547772c1..856051f50eb7 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_vf.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_vf.c
@@ -231,7 +231,7 @@ static void qed_vf_pf_acquire_reduce_resc(struct qed_hwfn *p_hwfn,
 {
 	DP_VERBOSE(p_hwfn,
 		   QED_MSG_IOV,
-		   "PF unwilling to fullill resource request: rxq [%02x/%02x] txq [%02x/%02x] sbs [%02x/%02x] mac [%02x/%02x] vlan [%02x/%02x] mc [%02x/%02x] cids [%02x/%02x]. Try PF recommended amount\n",
+		   "PF unwilling to fulfill resource request: rxq [%02x/%02x] txq [%02x/%02x] sbs [%02x/%02x] mac [%02x/%02x] vlan [%02x/%02x] mc [%02x/%02x] cids [%02x/%02x]. Try PF recommended amount\n",
 		   p_req->num_rxqs,
 		   p_resp->num_rxqs,
 		   p_req->num_rxqs,
-- 
2.20.1
