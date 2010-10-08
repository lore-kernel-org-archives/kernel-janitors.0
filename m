From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Oct 2010 12:57:44 +0000
Subject: [patch] Staging: bcm: remove unneeded NULL check
Message-Id: <20101008125744.GN11681@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The error handling here is wrong.  If psIntfAdapter were NULL then we
would have a NULL dereference in the debug output on the error path.
But this function is only called from usbbcm_device_probe() when
psIntfAdapter is non-NULL.

Since the check isn't needed and I removed it instead of fixing it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/bcm/InterfaceInit.c b/drivers/staging/bcm/InterfaceInit.c
index 81523b1..824f9a4 100644
--- a/drivers/staging/bcm/InterfaceInit.c
+++ b/drivers/staging/bcm/InterfaceInit.c
@@ -529,11 +529,6 @@ INT InterfaceAdapterInit(PS_INTERFACE_ADAPTER psIntfAdapter)
 	BOOLEAN bBcm16 = FALSE;
 	UINT uiData = 0;
 
-	if(psIntfAdapter = NULL)
-	{
-		BCM_DEBUG_PRINT(psIntfAdapter->psAdapter,DBG_TYPE_INITEXIT, DRV_ENTRY, DBG_LVL_ALL, "Interface Adapter is NULL");
-		return -EINVAL;
-	}
 	/* Store the usb dev into interface adapter */
 	psIntfAdapter->udev = usb_get_dev(interface_to_usbdev(
 								psIntfAdapter->interface));
