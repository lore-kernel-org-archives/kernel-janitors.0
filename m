From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Sep 2019 10:01:02 +0000
Subject: [PATCH] usb: cdns3: Fix use after free in probe error handling
Message-Id: <20190904100102.GB7007@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Laszczak <pawell@cadence.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

We can't use "wrap" after it has been freed.

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/cdns3/cdns3-pci-wrap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
index c41ddb61b857..b0a29efe7d31 100644
--- a/drivers/usb/cdns3/cdns3-pci-wrap.c
+++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
@@ -159,8 +159,9 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
 		wrap->plat_dev = platform_device_register_full(&plat_info);
 		if (IS_ERR(wrap->plat_dev)) {
 			pci_disable_device(pdev);
+			err = PTR_ERR(wrap->plat_dev);
 			kfree(wrap);
-			return PTR_ERR(wrap->plat_dev);
+			return err;
 		}
 	}
 
-- 
2.20.1
