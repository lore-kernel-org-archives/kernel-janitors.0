From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Dec 2014 19:20:46 +0000
Subject: [PATCH 4/20] dmfe: fix misspelling of current function in string
Message-Id: <1417980062-25151-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Grundler <grundler@parisc-linux.org>
Cc: kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

The function name contains cleanup, not clean.

This was done using Coccinelle, including the use of Levenshtein distance,
as proposed by Rasmus Villemoes.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch is difficult to summarize, but is available in the cover
letter of this patch series.

 drivers/net/ethernet/dec/tulip/dmfe.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/dec/tulip/dmfe.c b/drivers/net/ethernet/dec/tulip/dmfe.c
index c820560..50a0077 100644
--- a/drivers/net/ethernet/dec/tulip/dmfe.c
+++ b/drivers/net/ethernet/dec/tulip/dmfe.c
@@ -2265,7 +2265,7 @@ static int __init dmfe_init_module(void)
 
 static void __exit dmfe_cleanup_module(void)
 {
-	DMFE_DBUG(0, "dmfe_clean_module() ", debug);
+	DMFE_DBUG(0, "dmfe_cleanup_module() ", debug);
 	pci_unregister_driver(&dmfe_driver);
 }
 

