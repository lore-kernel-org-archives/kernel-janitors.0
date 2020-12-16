From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 12:36:04 +0000
Subject: [PATCH][next] octeontx2-af: Fix undetected unmap PF error check
Message-Id: <20201216123604.15369-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, George Cherian <george.cherian@marvell.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for an unmap PF error is always going to be false
because intr_val is a 32 bit int and is being bit-mask checked against
1ULL << 32.  Fix this by making intr_val a u64 to match the type at it
is copied from, namely npa_event_context->npa_af_rvu_ge.

Addresses-Coverity: ("Operands don't affect result")
Fixes: f1168d1e207c ("octeontx2-af: Add devlink health reporters for NPA")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu_devlink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_devlink.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_devlink.c
index 3f9d0ab6d5ae..bc0e4113370e 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_devlink.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_devlink.c
@@ -275,7 +275,8 @@ static int rvu_npa_report_show(struct devlink_fmsg *fmsg, void *ctx,
 			       enum npa_af_rvu_health health_reporter)
 {
 	struct rvu_npa_event_ctx *npa_event_context;
-	unsigned int intr_val, alloc_dis, free_dis;
+	unsigned int alloc_dis, free_dis;
+	u64 intr_val;
 	int err;
 
 	npa_event_context = ctx;
-- 
2.29.2
