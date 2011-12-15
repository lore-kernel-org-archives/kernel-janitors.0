From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Dec 2011 11:31:37 +0000
Subject: [patch] usb: renesas_usbhs: silence a gcc warning
Message-Id: <20111215113137.GA4013@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Gcc complains about this printk:
drivers/usb/renesas_usbhs/mod_gadget.c:188:3: warning: format ‘%x’
	expects argument of type ‘unsigned int’, but argument 3 has type
	‘dma_addr_t’ [-Wformat]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index db2a1c6..528691d5f 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -185,7 +185,7 @@ static int usbhsg_dma_map(struct device *dev,
 	}
 
 	if (dma_mapping_error(dev, pkt->dma)) {
-		dev_err(dev, "dma mapping error %x\n", pkt->dma);
+		dev_err(dev, "dma mapping error %llx\n", (u64)pkt->dma);
 		return -EIO;
 	}
 
