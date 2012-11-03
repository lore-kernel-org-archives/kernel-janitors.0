From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 10:58:36 +0000
Subject: [PATCH 15/16] drivers/parisc/pdc_stable.c: use WARN
Message-Id: <1351940317-14812-16-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: kernel-janitors@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/parisc/pdc_stable.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 246a92f..0f54ab6 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -212,12 +212,10 @@ pdcspath_store(struct pdcspath_entry *entry)
 			entry, devpath, entry->addr);
 
 	/* addr, devpath and count must be word aligned */
-	if (pdc_stable_write(entry->addr, devpath, sizeof(*devpath)) != PDC_OK) {
-		printk(KERN_ERR "%s: an error occurred when writing to PDC.\n"
+	if (pdc_stable_write(entry->addr, devpath, sizeof(*devpath)) != PDC_OK)
+		WARN(1, KERN_ERR "%s: an error occurred when writing to PDC.\n"
 				"It is likely that the Stable Storage data has been corrupted.\n"
 				"Please check it carefully upon next reboot.\n", __func__);
-		WARN_ON(1);
-	}
 		
 	/* kobject is already registered */
 	entry->ready = 2;

