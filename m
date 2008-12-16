From: Julia Lawall <julia@diku.dk>
Date: Tue, 16 Dec 2008 15:13:09 +0000
Subject: [PATCH 4/11] drivers/mmc: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0812161612440.20444@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drzeus-mmc@drzeus.cx, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, if the NULL test is necessary, then the dereference should be
moved below the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mmc/host/tmio_mmc.c         |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
index 95430b8..6a7a619 100644
--- a/drivers/mmc/host/tmio_mmc.c
+++ b/drivers/mmc/host/tmio_mmc.c
@@ -224,7 +224,7 @@ static inline void tmio_mmc_data_irq(struct tmio_mmc_host *host)
 {
 	void __iomem *ctl = host->ctl;
 	struct mmc_data *data = host->data;
-	struct mmc_command *stop = data->stop;
+	struct mmc_command *stop;
 
 	host->data = NULL;
 
@@ -232,6 +232,7 @@ static inline void tmio_mmc_data_irq(struct tmio_mmc_host *host)
 		pr_debug("Spurious data end IRQ\n");
 		return;
 	}
+	stop = data->stop;
 
 	/* FIXME - return correct transfer count on errors */
 	if (!data->error)
