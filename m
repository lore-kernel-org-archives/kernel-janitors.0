From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Sep 2017 19:11:33 +0000
Subject: [PATCH 1/3] [media] dvb-ttusb-budget: Use common error handling code in ttusb_probe()
Message-Id: <b737c705-34a3-61db-57c2-f9662cd1b434@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1ad3c3ce-3738-fee1-2ee5-37142fa1bc70@users.sourceforge.net>
In-Reply-To: <1ad3c3ce-3738-fee1-2ee5-37142fa1bc70@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Sep 2017 20:25:24 +0200

Add two jump targets so that a bit of exception handling can be better
reused at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
index b842f367249f..38394c9ecc67 100644
--- a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
@@ -1675,8 +1675,7 @@ static int ttusb_probe(struct usb_interface *intf, const struct usb_device_id *i
 	if (result < 0) {
 		dprintk("%s: ttusb_alloc_iso_urbs - failed\n", __func__);
 		mutex_unlock(&ttusb->semi2c);
-		kfree(ttusb);
-		return result;
+		goto err_free_usb;
 	}
 
 	if (ttusb_init_controller(ttusb))
@@ -1687,11 +1686,9 @@ static int ttusb_probe(struct usb_interface *intf, const struct usb_device_id *i
 	result = dvb_register_adapter(&ttusb->adapter,
 				      "Technotrend/Hauppauge Nova-USB",
 				      THIS_MODULE, &udev->dev, adapter_nr);
-	if (result < 0) {
-		ttusb_free_iso_urbs(ttusb);
-		kfree(ttusb);
-		return result;
-	}
+	if (result < 0)
+		goto err_free_iso_urbs;
+
 	ttusb->adapter.priv = ttusb;
 
 	/* i2c */
@@ -1762,7 +1759,9 @@ static int ttusb_probe(struct usb_interface *intf, const struct usb_device_id *i
 	i2c_del_adapter(&ttusb->i2c_adap);
 err_unregister_adapter:
 	dvb_unregister_adapter (&ttusb->adapter);
+err_free_iso_urbs:
 	ttusb_free_iso_urbs(ttusb);
+err_free_usb:
 	kfree(ttusb);
 	return result;
 }
-- 
2.14.1

