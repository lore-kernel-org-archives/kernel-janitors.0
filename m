From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 06:32:51 +0000
Subject: [patch -next] smsc95xx: signedness bug in get_regs()
Message-Id: <20120711063251.GB11812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Glendinning <steve.glendinning-sdUf+H5yV5I@public.gmane.org>, Emeric Vigier <emeric.vigier-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

"retval" has to be a signed integer for the error handling to work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 05ecf14..bd7cbaa 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -589,7 +589,8 @@ smsc95xx_ethtool_getregs(struct net_device *netdev, struct ethtool_regs *regs,
 			 void *buf)
 {
 	struct usbnet *dev = netdev_priv(netdev);
-	unsigned int i, j, retval;
+	unsigned int i, j;
+	int retval;
 	u32 *data = buf;
 
 	retval = smsc95xx_read_reg(dev, ID_REV, &regs->version);
