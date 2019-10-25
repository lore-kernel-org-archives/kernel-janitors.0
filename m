From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 11:58:11 +0000
Subject: [PATCH][next] net: aquantia: fix unintention integer overflow on left shift
Message-Id: <20191025115811.20433-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Egor Pomozov <epomozov@marvell.com>, Igor Russkikh <igor.russkikh@aquantia.com>, "David S . Miller" <davem@davemloft.net>, Dmitry Bezrukov <dmitry.bezrukov@aquantia.com>, Sergey Samoilenko <sergey.samoilenko@aquantia.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting the integer value 1 is evaluated using 32-bit
arithmetic and then used in an expression that expects a 64-bit
value, so there is potentially an integer overflow. Fix this
by using the BIT_ULL macro to perform the shift and avoid the
overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 04a1839950d9 ("net: aquantia: implement data PTP datapath")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_ptp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
index 232df785488c..3eb9d22f7402 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
@@ -713,7 +713,7 @@ static int aq_ptp_poll(struct napi_struct *napi, int budget)
 	if (work_done < budget) {
 		napi_complete_done(napi, work_done);
 		aq_nic->aq_hw_ops->hw_irq_enable(aq_nic->aq_hw,
-					1 << aq_ptp->ptp_ring_param.vec_idx);
+					BIT_ULL(aq_ptp->ptp_ring_param.vec_idx));
 	}
 
 err_exit:
-- 
2.20.1
