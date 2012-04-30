From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 30 Apr 2012 05:46:52 +0000
Subject: [PATCH] drivers/edac/i82875p_edac.c: eliminate double definition
Message-Id: <1335764812-29927-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Thompson <dougthompson@xmission.com>
Cc: kernel-janitors@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The first thing that i82875p_setup_overfl_dev does is overwrite the value
of ovrfl_pdev and perform the same call to pci_get_device as is done here.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/edac/i82875p_edac.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/edac/i82875p_edac.c b/drivers/edac/i82875p_edac.c
index 10f15d8..22ecc54 100644
--- a/drivers/edac/i82875p_edac.c
+++ b/drivers/edac/i82875p_edac.c
@@ -391,8 +391,6 @@ static int i82875p_probe1(struct pci_dev *pdev, int dev_idx)
 
 	debugf0("%s()\n", __func__);
 
-	ovrfl_pdev = pci_get_device(PCI_VEND_DEV(INTEL, 82875_6), NULL);
-
 	if (i82875p_setup_overfl_dev(pdev, &ovrfl_pdev, &ovrfl_window))
 		return -ENODEV;
 	drc = readl(ovrfl_window + I82875P_DRC);

