From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Jul 2017 05:59:37 +0000
Subject: [PATCH 08/12] mmc: vub300: constify mmc_host_ops structures
Message-Id: <1501307981-29745-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501307981-29745-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501307981-29745-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Olech <tony.olech-ze5PQcJzaeOs0fm86SgGizGjJy/sRE9J@public.gmane.org>
Cc: bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

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
 drivers/mmc/host/vub300.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index fbeea1a..6e08597 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -2079,7 +2079,7 @@ static void vub300_init_card(struct mmc_host *mmc, struct mmc_card *card)
 	dev_info(&vub300->udev->dev, "NO host QUIRKS for this card\n");
 }
 
-static struct mmc_host_ops vub300_mmc_ops = {
+static const struct mmc_host_ops vub300_mmc_ops = {
 	.request = vub300_mmc_request,
 	.set_ios = vub300_mmc_set_ios,
 	.get_ro = vub300_mmc_get_ro,

