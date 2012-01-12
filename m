From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 12 Jan 2012 09:55:10 +0000
Subject: [PATCH 8/15] drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c: add missing iounmap
Message-Id: <1326362117-29371-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Add missing iounmap in error handling code, in a case where the function
already preforms iounmap on some other execution path.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
statement S,S1;
int ret;
@@
e = \(ioremap\|ioremap_nocache\)(...)
... when != iounmap(e)
if (<+...e...+>) S
... when any
    when != iounmap(e)
*if (...)
   { ... when != iounmap(e)
     return ...; }
... when any
iounmap(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 7b1594f..1ac8324 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -62,7 +62,7 @@ static int stmmac_pltfr_probe(struct platform_device *pdev)
 	priv = stmmac_dvr_probe(&(pdev->dev), plat_dat);
 	if (!priv) {
 		pr_err("%s: main drivr probe failed", __func__);
-		goto out_release_region;
+		goto out_unmap;
 	}
 
 	priv->ioaddr = addr;

