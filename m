From: Colin King <colin.king@canonical.com>
Date: Mon, 22 Jan 2018 15:25:43 +0000
Subject: [PATCH] net: caif: remove redundant re-assignment of pointer pfrm
Message-Id: <20180122152543.14719-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer pfrm is initialized and then later re-assigned the same
value and hence the second assignment is redundant and can be removed.

Cleans up clang warning:
drivers/net/caif/caif_hsi.c:222:6: warning: Value stored to 'pfrm'
during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/caif/caif_hsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/caif/caif_hsi.c b/drivers/net/caif/caif_hsi.c
index b8029ea03307..433a14b9f731 100644
--- a/drivers/net/caif/caif_hsi.c
+++ b/drivers/net/caif/caif_hsi.c
@@ -264,7 +264,6 @@ static int cfhsi_tx_frm(struct cfhsi_desc *desc, struct cfhsi *cfhsi)
 	}
 
 	/* Create payload CAIF frames. */
-	pfrm = desc->emb_frm + CFHSI_MAX_EMB_FRM_SZ;
 	while (nfrms < CFHSI_MAX_PKTS) {
 		struct caif_payload_info *info;
 		int hpad;
-- 
2.15.1

