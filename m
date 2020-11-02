From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Nov 2020 13:46:01 +0000
Subject: [PATCH] octeontx2-pf: Fix sizeof() mismatch
Message-Id: <20201102134601.698436-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, hariprasad <hkelam@marvell.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof() is being used, sizeof(u64 *) is not correct,
it should be sizeof(*sq->sqb_ptrs).

Fixes: caa2da34fd25 ("octeontx2-pf: Initialize and config queues")
Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
index fc765e86988e..9f3d6715748e 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
@@ -1239,7 +1239,7 @@ int otx2_sq_aura_pool_init(struct otx2_nic *pfvf)
 
 		sq = &qset->sq[qidx];
 		sq->sqb_count = 0;
-		sq->sqb_ptrs = kcalloc(num_sqbs, sizeof(u64 *), GFP_KERNEL);
+		sq->sqb_ptrs = kcalloc(num_sqbs, sizeof(*sq->sqb_ptrs), GFP_KERNEL);
 		if (!sq->sqb_ptrs)
 			return -ENOMEM;
 
-- 
2.27.0
