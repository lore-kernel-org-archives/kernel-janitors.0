From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 06 Dec 2012 21:11:26 +0000
Subject: [PATCH] drivers/nfc/nfcwilink.c: use devm_kzalloc
Message-Id: <1354831840-21623-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: kernel-janitors@vger.kernel.org, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-wireless@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm_kzalloc allocates memory that is released when a driver detaches.
This patch uses devm_kzalloc for data that is allocated in the probe
function of a platform device and is only freed in the remove function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/nfc/nfcwilink.c |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/nfcwilink.c b/drivers/nfc/nfcwilink.c
index 50b1ee4..c7c182d 100644
--- a/drivers/nfc/nfcwilink.c
+++ b/drivers/nfc/nfcwilink.c
@@ -526,7 +526,7 @@ static int nfcwilink_probe(struct platform_device *pdev)
 
 	nfc_dev_dbg(&pdev->dev, "probe entry");
 
-	drv = kzalloc(sizeof(struct nfcwilink), GFP_KERNEL);
+	drv = devm_kzalloc(&pdev->dev, sizeof(struct nfcwilink), GFP_KERNEL);
 	if (!drv) {
 		rc = -ENOMEM;
 		goto exit;
@@ -547,7 +547,7 @@ static int nfcwilink_probe(struct platform_device *pdev)
 	if (!drv->ndev) {
 		nfc_dev_err(&pdev->dev, "nci_allocate_device failed");
 		rc = -ENOMEM;
-		goto free_exit;
+		goto exit;
 	}
 
 	nci_set_parent_dev(drv->ndev, &pdev->dev);
@@ -566,9 +566,6 @@ static int nfcwilink_probe(struct platform_device *pdev)
 free_dev_exit:
 	nci_free_device(drv->ndev);
 
-free_exit:
-	kfree(drv);
-
 exit:
 	return rc;
 }
@@ -588,8 +585,6 @@ static int nfcwilink_remove(struct platform_device *pdev)
 	nci_unregister_device(ndev);
 	nci_free_device(ndev);
 
-	kfree(drv);
-
 	dev_set_drvdata(&pdev->dev, NULL);
 
 	return 0;

