From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 30 Jul 2010 11:09:02 +0000
Subject: [PATCH 6/9] staging: rtl8192su: check whether requests succeeded
Message-Id: <1280488143-20899-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

rtl8192_usb_probe() does not check alloc_ieee80211() and
register_netdev() return values for errors.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/rtl8192su/r8192U_core.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/rtl8192su/r8192U_core.c b/drivers/staging/rtl8192su/r8192U_core.c
index b69e198..8acfaaf 100644
--- a/drivers/staging/rtl8192su/r8192U_core.c
+++ b/drivers/staging/rtl8192su/r8192U_core.c
@@ -7385,6 +7385,8 @@ static int __devinit rtl8192_usb_probe(struct usb_interface *intf,
         RT_TRACE(COMP_INIT, "Oops: i'm coming\n");
 
 	dev = alloc_ieee80211(sizeof(struct r8192_priv));
+	if (dev = NULL)
+		return -ENOMEM;
 
 	usb_set_intfdata(intf, dev);
 	SET_NETDEV_DEV(dev, &intf->dev);
@@ -7422,7 +7424,8 @@ static int __devinit rtl8192_usb_probe(struct usb_interface *intf,
 	netif_carrier_off(dev);
 	netif_stop_queue(dev);
 
-	register_netdev(dev);
+	if (register_netdev(dev))
+		goto fail;
 	RT_TRACE(COMP_INIT, "dev name====> %s\n",dev->name);
 	rtl8192_proc_init_one(dev);
 
-- 
1.7.0.4

