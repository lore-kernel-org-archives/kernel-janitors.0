From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Jun 2013 22:48:26 +0000
Subject: [patch -next] NFC: fix enable/disable confusion
Message-Id: <20130617224826.GA1562@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a cut and paste bug so we enable a second time instead of
disabling.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index 7b1c186..3fdefc1 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -717,7 +717,7 @@ static int hci_disable_se(struct nfc_dev *nfc_dev, u32 se_idx)
 	struct nfc_hci_dev *hdev = nfc_get_drvdata(nfc_dev);
 
 	if (hdev->ops->disable_se)
-		return hdev->ops->enable_se(hdev, se_idx);
+		return hdev->ops->disable_se(hdev, se_idx);
 
 	return 0;
 }
