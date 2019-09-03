From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Sep 2019 12:07:10 +0000
Subject: [PATCH][usb-next] usb: cdns3: fix spelling mistake: "cnfiguration" -> "configuration"
Message-Id: <20190903120710.30128-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Laszczak <pawell@cadence.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 3094ad65ffc9..acf2d4c6a68c 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2630,7 +2630,7 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 		readl(&priv_dev->regs->usb_cap6));
 	dev_dbg(priv_dev->dev, "USB Capabilities:: %08x\n",
 		readl(&priv_dev->regs->usb_cap1));
-	dev_dbg(priv_dev->dev, "On-Chip memory cnfiguration: %08x\n",
+	dev_dbg(priv_dev->dev, "On-Chip memory configuration: %08x\n",
 		readl(&priv_dev->regs->usb_cap2));
 
 	priv_dev->dev_ver = GET_DEV_BASE_VERSION(priv_dev->dev_ver);
-- 
2.20.1
