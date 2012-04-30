From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 30 Apr 2012 05:58:58 +0000
Subject: [PATCH] drivers/edac/i3200_edac.c: add missing iounmap
Message-Id: <1335765538-30399-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Thompson <dougthompson@xmission.com>
Cc: kernel-janitors@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Add iounmap in the case where window has already been allocated.
Reorganize the error handling code at the end of the function so that if is
not needed.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/edac/i3200_edac.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/i3200_edac.c b/drivers/edac/i3200_edac.c
index 046808c..55c4336 100644
--- a/drivers/edac/i3200_edac.c
+++ b/drivers/edac/i3200_edac.c
@@ -338,8 +338,10 @@ static int i3200_probe1(struct pci_dev *pdev, int dev_idx)
 
 	mci = edac_mc_alloc(sizeof(struct i3200_priv), I3200_RANKS,
 		nr_channels, 0);
-	if (!mci)
-		return -ENOMEM;
+	if (!mci) {
+		rc = -ENOMEM;
+		goto fail_alloc;
+	}
 
 	debugf3("MC: %s(): init mci\n", __func__);
 
@@ -404,9 +406,9 @@ static int i3200_probe1(struct pci_dev *pdev, int dev_idx)
 	return 0;
 
 fail:
+	edac_mc_free(mci);
+fail_alloc:
 	iounmap(window);
-	if (mci)
-		edac_mc_free(mci);
 
 	return rc;
 }

