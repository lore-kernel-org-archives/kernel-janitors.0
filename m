From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Jul 2017 05:59:34 +0000
Subject: [PATCH 05/12] mmc: sh_mmcif: constify mmc_host_ops structures
Message-Id: <1501307981-29745-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501307981-29745-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501307981-29745-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/mmc/host/sh_mmcif.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 4062d6b..53fb18b 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -1079,7 +1079,7 @@ static void sh_mmcif_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	host->state = STATE_IDLE;
 }
 
-static struct mmc_host_ops sh_mmcif_ops = {
+static const struct mmc_host_ops sh_mmcif_ops = {
 	.request	= sh_mmcif_request,
 	.set_ios	= sh_mmcif_set_ios,
 	.get_cd		= mmc_gpio_get_cd,

