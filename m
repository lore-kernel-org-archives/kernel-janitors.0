From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 08 Dec 2015 20:42:09 +0000
Subject: [PATCH] chelsio: constify cmac_ops structures
Message-Id: <1449607329-7572-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The cmac_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/ethernet/chelsio/cxgb/pm3393.c  |    2 +-
 drivers/net/ethernet/chelsio/cxgb/vsc7326.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb/pm3393.c b/drivers/net/ethernet/chelsio/cxgb/pm3393.c
index ec5e050..eb462d7 100644
--- a/drivers/net/ethernet/chelsio/cxgb/pm3393.c
+++ b/drivers/net/ethernet/chelsio/cxgb/pm3393.c
@@ -570,7 +570,7 @@ static void pm3393_destroy(struct cmac *cmac)
 	kfree(cmac);
 }
 
-static struct cmac_ops pm3393_ops = {
+static const struct cmac_ops pm3393_ops = {
 	.destroy                 = pm3393_destroy,
 	.reset                   = pm3393_reset,
 	.interrupt_enable        = pm3393_interrupt_enable,
diff --git a/drivers/net/ethernet/chelsio/cxgb/vsc7326.c b/drivers/net/ethernet/chelsio/cxgb/vsc7326.c
index b0cb388..6f30b6f 100644
--- a/drivers/net/ethernet/chelsio/cxgb/vsc7326.c
+++ b/drivers/net/ethernet/chelsio/cxgb/vsc7326.c
@@ -666,7 +666,7 @@ static void mac_destroy(struct cmac *mac)
 	kfree(mac);
 }
 
-static struct cmac_ops vsc7326_ops = {
+static const struct cmac_ops vsc7326_ops = {
 	.destroy                  = mac_destroy,
 	.reset                    = mac_reset,
 	.interrupt_handler        = mac_intr_handler,

