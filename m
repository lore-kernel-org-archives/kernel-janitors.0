From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Apr 2019 13:15:00 +0000
Subject: [PATCH] nfp: abm: fix spelling mistake "offseting" -> "offsetting"
Message-Id: <20190417131500.4793-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, John Hurley <john.hurley@netronome.com>, oss-drivers@netronome.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of spelling mistakes in NL_SET_ERR_MSG_MOD error
messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/netronome/nfp/abm/cls.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/abm/cls.c b/drivers/net/ethernet/netronome/nfp/abm/cls.c
index 9852080cf454..ff3913085665 100644
--- a/drivers/net/ethernet/netronome/nfp/abm/cls.c
+++ b/drivers/net/ethernet/netronome/nfp/abm/cls.c
@@ -39,7 +39,7 @@ nfp_abm_u32_check_knode(struct nfp_abm *abm, struct tc_cls_u32_knode *knode,
 	}
 	if (knode->sel->off || knode->sel->offshift || knode->sel->offmask ||
 	    knode->sel->offoff || knode->fshift) {
-		NL_SET_ERR_MSG_MOD(extack, "variable offseting not supported");
+		NL_SET_ERR_MSG_MOD(extack, "variable offsetting not supported");
 		return false;
 	}
 	if (knode->sel->hoff || knode->sel->hmask) {
@@ -78,7 +78,7 @@ nfp_abm_u32_check_knode(struct nfp_abm *abm, struct tc_cls_u32_knode *knode,
 
 	k = &knode->sel->keys[0];
 	if (k->offmask) {
-		NL_SET_ERR_MSG_MOD(extack, "offset mask - variable offseting not supported");
+		NL_SET_ERR_MSG_MOD(extack, "offset mask - variable offsetting not supported");
 		return false;
 	}
 	if (k->off) {
-- 
2.20.1
