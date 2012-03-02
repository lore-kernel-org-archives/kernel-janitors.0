From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Mar 2012 08:08:14 +0000
Subject: [patch] usb: otg: make probe() work again
Message-Id: <20120302080813.GA15608@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The probe() function will always fail because we're testing the wrong
variable.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/otg/ab8500-usb.c b/drivers/usb/otg/ab8500-usb.c
index e6371ff..a84af67 100644
--- a/drivers/usb/otg/ab8500-usb.c
+++ b/drivers/usb/otg/ab8500-usb.c
@@ -489,7 +489,7 @@ static int __devinit ab8500_usb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	otg = kzalloc(sizeof *otg, GFP_KERNEL);
-	if (!ab->phy.otg) {
+	if (!otg) {
 		kfree(ab);
 		return -ENOMEM;
 	}
