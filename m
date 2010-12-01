From: David Chosrova <david.chosrova@libertysurf.fr>
Date: Wed, 01 Dec 2010 12:42:16 +0000
Subject: [PATCH] Staging: rtl8192u: check return code kmalloc.
Message-Id: <20101201124216.GA28979@debian.home>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de
Cc: devel@driverdev.osuosl.org, error27@gmail.com, andreamrl@tiscali.it, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch checks the return code of  kmalloc when trying to allocate memory for priv->rx_urb in rtl8192_usb_initendpoints(), return -ENOMEM when failed.


Signed-off-by: David Chosrova <david.chosrova@libertysurf.fr>

---
Compiled

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 494f180..67ba8f7 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2203,6 +2203,8 @@ short rtl8192_usb_initendpoints(struct net_device *dev)
 
 	priv->rx_urb = kmalloc(sizeof(struct urb *) * (MAX_RX_URB+1),
 				GFP_KERNEL);
+	if (priv->rx_urb = NULL)
+		return -ENOMEM;
 
 #ifndef JACKSON_NEW_RX
 	for(i=0;i<(MAX_RX_URB+1);i++){
