From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 21 Apr 2012 14:08:19 +0000
Subject: [PATCH] drivers/block/cciss.c: correct size computation
Message-Id: <1335017299-30356-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Miller <mike.miller@hp.com>
Cc: kernel-janitors@vger.kernel.org, iss_storagedev@hp.com, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The size argument to remap_pci_mem should be the size of desired structure,
not the pointer to it.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@expression@
expression *x;
@@

x  <+...
-sizeof(x)
+sizeof(*x)
...+>
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/block/cciss.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index b0f553b..9f50d7d 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -4209,7 +4209,7 @@ static int __devinit cciss_find_cfgtables(ctlr_info_t *h)
 	if (rc)
 		return rc;
 	h->cfgtable = remap_pci_mem(pci_resource_start(h->pdev,
-		cfg_base_addr_index) + cfg_offset, sizeof(h->cfgtable));
+		cfg_base_addr_index) + cfg_offset, sizeof(*h->cfgtable));
 	if (!h->cfgtable)
 		return -ENOMEM;
 	rc = write_driver_ver_to_cfgtable(h->cfgtable);

