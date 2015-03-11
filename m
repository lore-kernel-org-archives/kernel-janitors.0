From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 11 Mar 2015 16:56:34 +0000
Subject: [PATCH 12/15] i82443bxgx_edac: don't export static symbol
Message-Id: <1426092997-30605-13-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Small <tim@buttersideup.com>
Cc: kernel-janitors@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
identifier f;
@@

static T f (...) { ... }

@@
identifier r.f;
declarer name EXPORT_SYMBOL_GPL;
@@

-EXPORT_SYMBOL_GPL(f);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/edac/i82443bxgx_edac.c |    4 ----
 1 file changed, 4 deletions(-)

diff -u -p a/drivers/edac/i82443bxgx_edac.c b/drivers/edac/i82443bxgx_edac.c
--- a/drivers/edac/i82443bxgx_edac.c
+++ b/drivers/edac/i82443bxgx_edac.c
@@ -350,8 +350,6 @@ fail:
 	return -ENODEV;
 }
 
-EXPORT_SYMBOL_GPL(i82443bxgx_edacmc_probe1);
-
 /* returns count (>= 0), or negative on error */
 static int i82443bxgx_edacmc_init_one(struct pci_dev *pdev,
 				      const struct pci_device_id *ent)
@@ -384,8 +382,6 @@ static void i82443bxgx_edacmc_remove_one
 	edac_mc_free(mci);
 }
 
-EXPORT_SYMBOL_GPL(i82443bxgx_edacmc_remove_one);
-
 static const struct pci_device_id i82443bxgx_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82443BX_0)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82443BX_2)},

