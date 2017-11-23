From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Nov 2017 11:31:33 +0000
Subject: [PATCH] bna: remove redundant self assignment of 'i'
Message-Id: <20171123113133.20928-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasesh Mody <rasesh.mody@cavium.com>, Sudarsana Kalluru <sudarsana.kalluru@cavium.com>, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of variable i to itself is redundant and can be removed.
Detected with Coccinelle.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/brocade/bna/bna_enet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/brocade/bna/bna_enet.c b/drivers/net/ethernet/brocade/bna/bna_enet.c
index a6606622764b..8d05a5c2450f 100644
--- a/drivers/net/ethernet/brocade/bna/bna_enet.c
+++ b/drivers/net/ethernet/brocade/bna/bna_enet.c
@@ -1797,7 +1797,7 @@ bna_ucam_mod_init(struct bna_ucam_mod *ucam_mod, struct bna *bna,
 
 	/* A separate queue to allow synchronous setting of a list of MACs */
 	INIT_LIST_HEAD(&ucam_mod->del_q);
-	for (i = i; i < (bna->ioceth.attr.num_ucmac * 2); i++)
+	for (; i < (bna->ioceth.attr.num_ucmac * 2); i++)
 		list_add_tail(&ucam_mod->ucmac[i].qe, &ucam_mod->del_q);
 
 	ucam_mod->bna = bna;
@@ -1832,7 +1832,7 @@ bna_mcam_mod_init(struct bna_mcam_mod *mcam_mod, struct bna *bna,
 
 	/* A separate queue to allow synchronous setting of a list of MACs */
 	INIT_LIST_HEAD(&mcam_mod->del_q);
-	for (i = i; i < (bna->ioceth.attr.num_mcmac * 2); i++)
+	for (; i < (bna->ioceth.attr.num_mcmac * 2); i++)
 		list_add_tail(&mcam_mod->mcmac[i].qe, &mcam_mod->del_q);
 
 	mcam_mod->bna = bna;
-- 
2.14.1

