From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jan 2016 10:12:42 +0000
Subject: [PATCH v3 2/3] gianfar: Delete unnecessary variable initialisations in gfar_ethflow_to_filer_table()
Message-Id: <5698C61A.90504@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56866E7F.8080609@users.sourceforge.net>
 <5698C53C.8060204@users.sourceforge.net>
In-Reply-To: <5698C53C.8060204@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Claudiu Manoil <claudiu.manoil@freescale.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jan 2016 10:40:24 +0100

Omit explicit initialisation at the beginning for four local variables
which are redefined before their first use.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/freescale/gianfar_ethtool.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/gianfar_ethtool.c b/drivers/net/ethernet/freescale/gianfar_ethtool.c
index 825b051..8302f7d 100644
--- a/drivers/net/ethernet/freescale/gianfar_ethtool.c
+++ b/drivers/net/ethernet/freescale/gianfar_ethtool.c
@@ -768,12 +768,12 @@ static void ethflow_to_filer_rules (struct gfar_private *priv, u64 ethflow)
 static int gfar_ethflow_to_filer_table(struct gfar_private *priv, u64 ethflow,
 				       u64 class)
 {
-	unsigned int last_rule_idx = priv->cur_filer_idx;
+	unsigned int last_rule_idx;
 	unsigned int cmp_rqfpr;
 	unsigned int *local_rqfpr;
 	unsigned int *local_rqfcr;
-	int i = 0x0, k = 0x0;
-	int j = MAX_FILER_IDX, l = 0x0;
+	int i, k, l;
+	int j = MAX_FILER_IDX;
 	int ret = 1;
 
 	local_rqfpr = kmalloc_array(MAX_FILER_IDX + 1, sizeof(unsigned int),
-- 
2.6.3

