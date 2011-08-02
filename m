From: Thomas Meyer <thomas@m3y3r.de>
Date: Tue, 02 Aug 2011 16:09:28 +0000
Subject: [PATCH] net/usb: Use kzalloc
Message-Id: <1312301372.2629.10.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--- a/drivers/net/usb/cdc_ncm.c 2011-07-26 00:46:08.126846923 +0200
+++ b/drivers/net/usb/cdc_ncm.c 2011-08-01 20:20:43.396390040 +0200
@@ -479,12 +479,10 @@ static int cdc_ncm_bind(struct usbnet *d
 	int temp;
 	u8 iface_no;
 
-	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (ctx = NULL)
 		return -ENODEV;
 
-	memset(ctx, 0, sizeof(*ctx));
-
 	init_timer(&ctx->tx_timer);
 	spin_lock_init(&ctx->mtx);
 	ctx->netdev = dev->net;


