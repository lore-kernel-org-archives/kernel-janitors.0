From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Jul 2017 05:59:31 +0000
Subject: [PATCH 02/12] mmc: s3cmci: constify mmc_host_ops structures
Message-Id: <1501307981-29745-3-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/mmc/host/s3cmci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/s3cmci.c b/drivers/mmc/host/s3cmci.c
index 8896bf5..f7f157a 100644
--- a/drivers/mmc/host/s3cmci.c
+++ b/drivers/mmc/host/s3cmci.c
@@ -1313,7 +1313,7 @@ static void s3cmci_enable_sdio_irq(struct mmc_host *mmc, int enable)
 	s3cmci_check_sdio_irq(host);
 }
 
-static struct mmc_host_ops s3cmci_ops = {
+static const struct mmc_host_ops s3cmci_ops = {
 	.request	= s3cmci_request,
 	.set_ios	= s3cmci_set_ios,
 	.get_ro		= mmc_gpio_get_ro,

