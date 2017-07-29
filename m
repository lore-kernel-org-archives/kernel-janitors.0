From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Jul 2017 05:59:33 +0000
Subject: [PATCH 04/12] mmc: moxart: constify mmc_host_ops structures
Message-Id: <1501307981-29745-5-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/mmc/host/moxart-mmc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/moxart-mmc.c b/drivers/mmc/host/moxart-mmc.c
index d4dc55a..a0670e9 100644
--- a/drivers/mmc/host/moxart-mmc.c
+++ b/drivers/mmc/host/moxart-mmc.c
@@ -546,7 +546,7 @@ static int moxart_get_ro(struct mmc_host *mmc)
 	return !!(readl(host->base + REG_STATUS) & WRITE_PROT);
 }
 
-static struct mmc_host_ops moxart_ops = {
+static const struct mmc_host_ops moxart_ops = {
 	.request = moxart_request,
 	.set_ios = moxart_set_ios,
 	.get_ro = moxart_get_ro,

