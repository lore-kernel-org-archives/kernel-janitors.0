From: Dan Carpenter <error27@gmail.com>
Date: Mon, 14 Mar 2011 09:35:31 +0000
Subject: [patch 2/2] Staging: crystalhd: don't waste the last char of buffer
Message-Id: <20110314093531.GM2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

pinfo->name is a 32 char buffer.  In the original code, the last char
wasn't fully utilized.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/crystalhd/crystalhd_lnx.c b/drivers/staging/crystalhd/crystalhd_lnx.c
index 4197111..7e0c199 100644
--- a/drivers/staging/crystalhd/crystalhd_lnx.c
+++ b/drivers/staging/crystalhd/crystalhd_lnx.c
@@ -562,7 +562,7 @@ static int __devinit chd_dec_pci_probe(struct pci_dev *pdev,
 		goto err;
 	}
 
-	snprintf(pinfo->name, 31, "crystalhd_pci_e:%d:%d:%d",
+	snprintf(pinfo->name, sizeof(pinfo->name), "crystalhd_pci_e:%d:%d:%d",
 		 pdev->bus->number, PCI_SLOT(pdev->devfn),
 		 PCI_FUNC(pdev->devfn));
 
