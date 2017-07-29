From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Jul 2017 05:59:41 +0000
Subject: [PATCH 12/12] mmc: bcm2835: constify mmc_host_ops structures
Message-Id: <1501307981-29745-13-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501307981-29745-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501307981-29745-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The mmc_host_ops structure is only stored in the ops field of an
mmc_host structure, which is declared as const.  Thus the mmc_host_ops
structure itself can be const.

Done with the help of Coccinelle.

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct mmc_host_ops i@p = { ... };

@ok1@
struct mmc_host *mmc;
identifier r.i;
position p;
@@
mmc->ops = &i@p

@bad@
position p != {r.p,ok1.p};
identifier r.i;
struct mmc_host_ops e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct mmc_host_ops i = { ... };
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mmc/host/bcm2835.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index abba9a2..229dc18 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -1252,7 +1252,7 @@ static void bcm2835_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	mutex_unlock(&host->mutex);
 }
 
-static struct mmc_host_ops bcm2835_ops = {
+static const struct mmc_host_ops bcm2835_ops = {
 	.request = bcm2835_request,
 	.set_ios = bcm2835_set_ios,
 	.hw_reset = bcm2835_reset,

