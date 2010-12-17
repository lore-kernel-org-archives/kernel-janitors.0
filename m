From: Dan Carpenter <error27@gmail.com>
Date: Fri, 17 Dec 2010 13:25:43 +0000
Subject: [patch] USB: mcs7830: return negative if auto negotiate fails
Message-Id: <20101217132542.GL1639@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code returns 0 on success and 1 on failure.  In fact, at
this point, "ret" is already either zero or a negative error code so
we can just return it directly.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/usb/mcs7830.c b/drivers/net/usb/mcs7830.c
index a6281e3..f3fe8e1 100644
--- a/drivers/net/usb/mcs7830.c
+++ b/drivers/net/usb/mcs7830.c
@@ -351,7 +351,7 @@ static int mcs7830_set_autoneg(struct usbnet *dev, int ptrUserPhyMode)
 	if (!ret)
 		ret = mcs7830_write_phy(dev, MII_BMCR,
 				BMCR_ANENABLE | BMCR_ANRESTART	);
-	return ret < 0 ? : 0;
+	return ret;
 }
 
 
