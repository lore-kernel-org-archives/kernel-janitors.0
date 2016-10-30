From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 30 Oct 2016 21:40:47 +0000
Subject: [PATCH] cxl: Fix error handling
Message-Id: <20161030214047.25037-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030213451.24624-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030213451.24624-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'cxl_dev_context_init()' returns an error pointer in case of error, not
NULL. So test it with IS_ERR.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
un-compiled because I don't have the required  cross build environment.
---
 drivers/misc/cxl/pci.c | 2 +-
 drivers/misc/cxl/phb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/cxl/pci.c b/drivers/misc/cxl/pci.c
index e96be9ca4e60..80a87ab25b83 100644
--- a/drivers/misc/cxl/pci.c
+++ b/drivers/misc/cxl/pci.c
@@ -1921,7 +1921,7 @@ static pci_ers_result_t cxl_pci_slot_reset(struct pci_dev *pdev)
 				goto err;
 
 			ctx = cxl_dev_context_init(afu_dev);
-			if (!ctx)
+			if (IS_ERR(ctx))
 				goto err;
 
 			afu_dev->dev.archdata.cxl_ctx = ctx;
diff --git a/drivers/misc/cxl/phb.c b/drivers/misc/cxl/phb.c
index 0935d44c1770..6ec69ada19f4 100644
--- a/drivers/misc/cxl/phb.c
+++ b/drivers/misc/cxl/phb.c
@@ -20,7 +20,7 @@ bool _cxl_pci_associate_default_context(struct pci_dev *dev, struct cxl_afu *afu
 	 * in the virtual phb, we'll need a default context to attach them to.
 	 */
 	ctx = cxl_dev_context_init(dev);
-	if (!ctx)
+	if (IS_ERR(ctx))
 		return false;
 	dev->dev.archdata.cxl_ctx = ctx;
 
-- 
2.9.3

