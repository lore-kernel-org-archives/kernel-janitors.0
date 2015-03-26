From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Mar 2015 19:12:49 +0000
Subject: [patch v2] mcb: request_mem_region() returns NULL on error
Message-Id: <20150326191249.GA19563@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1422946459-25517-2-git-send-email-johannes.thumshirn@men.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Thumshirn <johannes.thumshirn@men.de>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The code here is checking for IS_ERR() when request_mem_region() only
returns NULL on error and never an ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: same as before but rebased on top of latest linux-next

diff --git a/drivers/mcb/mcb-pci.c b/drivers/mcb/mcb-pci.c
index 0af7361..de36237 100644
--- a/drivers/mcb/mcb-pci.c
+++ b/drivers/mcb/mcb-pci.c
@@ -56,9 +56,9 @@ static int mcb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	res = request_mem_region(priv->mapbase, CHAM_HEADER_SIZE,
 				 KBUILD_MODNAME);
-	if (IS_ERR(res)) {
+	if (!res) {
 		dev_err(&pdev->dev, "Failed to request PCI memory\n");
-		ret = PTR_ERR(res);
+		ret = -EBUSY;
 		goto out_disable;
 	}
 
