From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Oct 2018 07:36:47 +0000
Subject: [PATCH] usb: dwc2: pci: Fix an error code in probe
Message-Id: <20181018073647.5ud667degrrqzegc@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Minas Harutyunyan <hminas@synopsys.com>, Vardan Mikayelyan <mvardan@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

We added some error handling to this function but forgot to set the
error code on this path.

Fixes: ecd29dabb2ba ("usb: dwc2: pci: Handle error cleanup in probe")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/dwc2/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
index d257c541e51b..7afc10872f1f 100644
--- a/drivers/usb/dwc2/pci.c
+++ b/drivers/usb/dwc2/pci.c
@@ -120,6 +120,7 @@ static int dwc2_pci_probe(struct pci_dev *pci,
 	dwc2 = platform_device_alloc("dwc2", PLATFORM_DEVID_AUTO);
 	if (!dwc2) {
 		dev_err(dev, "couldn't allocate dwc2 device\n");
+		ret = -ENOMEM;
 		goto err;
 	}
 
-- 
2.11.0
