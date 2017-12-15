From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 10:34:01 +0000
Subject: [PATCH 5/7] rapidio: Delete an unnecessary variable initialisation in three functions
Message-Id: <ed729e8c-815c-8b56-a48f-1be579d0cc2b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
In-Reply-To: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 10:21:15 +0100

The local variable "rc" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rapidio/rio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index 90534365e46c..4604410fb001 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -441,7 +441,7 @@ int rio_request_inb_dbell(struct rio_mport *mport,
 			  void (*dinb) (struct rio_mport * mport, void *dev_id, u16 src,
 					u16 dst, u16 info))
 {
-	int rc = 0;
+	int rc;
 	struct resource *res = kzalloc(sizeof(*res), GFP_KERNEL);
 
 	if (res) {
@@ -693,7 +693,7 @@ EXPORT_SYMBOL_GPL(rio_pw_enable);
 int rio_map_inb_region(struct rio_mport *mport, dma_addr_t local,
 			u64 rbase, u32 size, u32 rflags)
 {
-	int rc = 0;
+	int rc;
 	unsigned long flags;
 
 	if (!mport->ops->map_inb)
@@ -737,7 +737,7 @@ EXPORT_SYMBOL_GPL(rio_unmap_inb_region);
 int rio_map_outb_region(struct rio_mport *mport, u16 destid, u64 rbase,
 			u32 size, u32 rflags, dma_addr_t *local)
 {
-	int rc = 0;
+	int rc;
 	unsigned long flags;
 
 	if (!mport->ops->map_outb)
-- 
2.15.1

