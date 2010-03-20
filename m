From: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 20 Mar 2010 14:12:44 +0000
Subject: [PATCH 03/24] usb/otg/isp1301_omap: Fix dangling pointer
Message-Id: <1269094385-16114-4-git-send-email-w.sang@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Fix this i2c-driver which missed setting clientdata to NULL before freeing the
structure it points to. Found by a semantic patch, but fixed by hand.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: David Brownell <dbrownell@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
---
 drivers/usb/otg/isp1301_omap.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/otg/isp1301_omap.c b/drivers/usb/otg/isp1301_omap.c
index 78a2097..0ad16e3 100644
--- a/drivers/usb/otg/isp1301_omap.c
+++ b/drivers/usb/otg/isp1301_omap.c
@@ -1224,7 +1224,9 @@ static void isp1301_release(struct device *dev)
 	/* ugly -- i2c hijacks our memory hook to wait_for_completion() */
 	if (isp->i2c_release)
 		isp->i2c_release(dev);
-	kfree (isp);
+
+	i2c_set_clientdata(isp->client, NULL);
+	kfree(isp);
 }
 
 static struct isp1301 *the_transceiver;
@@ -1629,6 +1631,7 @@ isp1301_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	return 0;
 
 fail:
+	i2c_set_clientdata(i2c, NULL);
 	kfree(isp);
 	return -ENODEV;
 }
-- 
1.7.0

