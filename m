From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 10:58:31 +0000
Subject: [PATCH 10/16] drivers/net/ethernet/ibm/emac/mal.c: use WARN
Message-Id: <1351940317-14812-11-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use WARN rather than printk followed by WARN_ON(1), for conciseness.

A simplified version of the semantic patch that makes this transformation
is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression list es;
@@

-printk(
+WARN(1,
  es);
-WARN_ON(1);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/ethernet/ibm/emac/mal.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/mal.c b/drivers/net/ethernet/ibm/emac/mal.c
index 479e43e..84c6b6c 100644
--- a/drivers/net/ethernet/ibm/emac/mal.c
+++ b/drivers/net/ethernet/ibm/emac/mal.c
@@ -738,13 +738,11 @@ static int __devexit mal_remove(struct platform_device *ofdev)
 	/* Synchronize with scheduled polling */
 	napi_disable(&mal->napi);
 
-	if (!list_empty(&mal->list)) {
+	if (!list_empty(&mal->list))
 		/* This is *very* bad */
-		printk(KERN_EMERG
+		WARN(1, KERN_EMERG
 		       "mal%d: commac list is not empty on remove!\n",
 		       mal->index);
-		WARN_ON(1);
-	}
 
 	dev_set_drvdata(&ofdev->dev, NULL);
 

