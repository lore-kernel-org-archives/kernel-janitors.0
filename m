From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Nov 2016 11:34:10 +0000
Subject: [patch] mailbox/tegra-hsp: Use after free in tegra_hsp_remove_doorbells()
Message-Id: <20161118113410.GC3150@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We have to use the _safe version of list_for_each() because we're
freeing the pointer as we go along.  (This might not show up testing
depending on what config options you have enabled).

Fixes: ed65ee43e397 ("mailbox: Add Tegra HSP driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 17b256a..87be8d3 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -397,12 +397,12 @@ static struct mbox_chan *of_tegra_hsp_xlate(struct mbox_controller *mbox,
 
 static void tegra_hsp_remove_doorbells(struct tegra_hsp *hsp)
 {
-	struct tegra_hsp_doorbell *db;
+	struct tegra_hsp_doorbell *db, *tmp;
 	unsigned long flags;
 
 	spin_lock_irqsave(&hsp->lock, flags);
 
-	list_for_each_entry(db, &hsp->doorbells, list)
+	list_for_each_entry_safe(db, tmp, &hsp->doorbells, list)
 		__tegra_hsp_doorbell_destroy(db);
 
 	spin_unlock_irqrestore(&hsp->lock, flags);
