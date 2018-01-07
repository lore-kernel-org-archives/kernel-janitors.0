From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 07 Jan 2018 20:54:00 +0000
Subject: [PATCH] EDAC, mv64x60: Fix an error handling path
Message-Id: <20180107205400.14068-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bp@alien8.de, mchehab@kernel.org
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

We should not call 'edac_mc_del_mc()' if a corresponding call to
'edac_mc_add_mc()' has not been performed yet.

So here, we should go to err instead of err2 to branch at the right place
of the error handling path.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/edac/mv64x60_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/mv64x60_edac.c b/drivers/edac/mv64x60_edac.c
index ec5d695bbb72..3c68bb525d5d 100644
--- a/drivers/edac/mv64x60_edac.c
+++ b/drivers/edac/mv64x60_edac.c
@@ -758,7 +758,7 @@ static int mv64x60_mc_err_probe(struct platform_device *pdev)
 		/* Non-ECC RAM? */
 		printk(KERN_WARNING "%s: No ECC DIMMs discovered\n", __func__);
 		res = -ENODEV;
-		goto err2;
+		goto err;
 	}
 
 	edac_dbg(3, "init mci\n");
-- 
2.14.1

