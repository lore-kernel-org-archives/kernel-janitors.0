From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Aug 2013 01:19:42 +0000
Subject: [patch] ab8500-charger: we print an unintended error message
Message-Id: <20130827011942.GD17061@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <anton@enomsg.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a missing break statement here, so we print an error message
that the USB type is invalid.  The original code still works fine
though except for the error message.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/power/ab8500_charger.c b/drivers/power/ab8500_charger.c
index f098fda..a4c4a10 100644
--- a/drivers/power/ab8500_charger.c
+++ b/drivers/power/ab8500_charger.c
@@ -774,6 +774,7 @@ static int ab8500_charger_max_usb_curr(struct ab8500_charger *di,
 		di->max_usb_in_curr.usb_type_max = USB_CH_IP_CUR_LVL_0P5;
 		dev_dbg(di->dev, "USB Type - 0x%02x MaxCurr: %d", link_status,
 				di->max_usb_in_curr.usb_type_max);
+		break;
 	case USB_STAT_NOT_VALID_LINK:
 		dev_err(di->dev, "USB Type invalid - try charging anyway\n");
 		di->max_usb_in_curr.usb_type_max = USB_CH_IP_CUR_LVL_0P5;
