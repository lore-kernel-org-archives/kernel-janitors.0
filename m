From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Aug 2017 16:54:04 +0000
Subject: [PATCH] staging: netlogic: Delete an error message for a failed memory allocation in xlr_config_spil
Message-Id: <7e6515bc-09ba-6b2a-ea64-433cc3befe6c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Bhumika Goyal <bhumirks@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Mihaela Muraru <mihaela.muraru21@gmail.com>, Mike Kofron <mpkofron@gmail.com>, Philippe Reynes <tremyfr@gmail.com>, Stephen Hemminger <stephen@networkplumber.org>, Tobias Klauser <tklauser@distanz.ch>, Yuval Shaia <yuval.shaia@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Aug 2017 18:44:12 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/netlogic/xlr_net.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/netlogic/xlr_net.c b/drivers/staging/netlogic/xlr_net.c
index e05ae4645d91..04cdcf3f329f 100644
--- a/drivers/staging/netlogic/xlr_net.c
+++ b/drivers/staging/netlogic/xlr_net.c
@@ -423,10 +423,8 @@ static void *xlr_config_spill(struct xlr_net_priv *priv, int reg_start_0,
 	base = priv->base_addr;
 	spill_size = size;
 	spill = kmalloc(spill_size + SMP_CACHE_BYTES, GFP_ATOMIC);
-	if (!spill) {
-		pr_err("Unable to allocate memory for spill area!\n");
+	if (!spill)
 		return ZERO_SIZE_PTR;
-	}
 
 	spill = PTR_ALIGN(spill, SMP_CACHE_BYTES);
 	phys_addr = virt_to_phys(spill);
-- 
2.14.0

