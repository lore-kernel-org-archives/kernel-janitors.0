From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Mar 2020 07:54:37 +0000
Subject: [PATCH] octeontx2-af: fix spelling mistake "backpessure" -> "backpressure"
Message-Id: <20200303075437.6704-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
index 80b1e39b0768..36953d4f51c7 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
@@ -393,7 +393,7 @@ int rvu_mbox_handler_nix_bp_enable(struct rvu *rvu,
 
 	for (chan = chan_base; chan < (chan_base + req->chan_cnt); chan++) {
 		if (bpid < 0) {
-			dev_warn(rvu->dev, "Fail to enable backpessure\n");
+			dev_warn(rvu->dev, "Fail to enable backpressure\n");
 			return -EINVAL;
 		}
 
-- 
2.25.0
