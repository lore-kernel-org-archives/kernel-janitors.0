From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Jul 2014 08:03:10 +0000
Subject: [patch] wan/x25_asy: integer overflow in x25_asy_change_mtu()
Message-Id: <20140717080310.GB477@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

If "newmtu * 2 + 4" is too large then it can cause an integer overflow
leading to memory corruption.  Btw, "newmtu" is not allowed to be a
negative number because of the check in dev_set_mtu(), so that's ok.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wan/x25_asy.c b/drivers/net/wan/x25_asy.c
index 5895f19..f04c8c1 100644
--- a/drivers/net/wan/x25_asy.c
+++ b/drivers/net/wan/x25_asy.c
@@ -122,8 +122,11 @@ static int x25_asy_change_mtu(struct net_device *dev, int newmtu)
 {
 	struct x25_asy *sl = netdev_priv(dev);
 	unsigned char *xbuff, *rbuff;
-	int len = 2 * newmtu;
+	int len;
 
+	if (newmtu > INT_MAX / 2 - 4)
+		return -EINVAL;
+	len = 2 * newmtu;
 	xbuff = kmalloc(len + 4, GFP_ATOMIC);
 	rbuff = kmalloc(len + 4, GFP_ATOMIC);
 
