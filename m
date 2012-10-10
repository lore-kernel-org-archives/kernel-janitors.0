From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Oct 2012 09:42:18 +0000
Subject: [patch] isdn: fix a wrapping bug in isdn_ppp_ioctl()
Message-Id: <20121010093816.GA3669@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: "David S. Miller" <davem@davemloft.net>, Masanari Iida <standby24x7@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"protos" is an array of unsigned longs and "i" is the number of bits in
an unsigned long so we need to use 1UL as well to prevent the shift
from wrapping around.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/isdn/i4l/isdn_ppp.c b/drivers/isdn/i4l/isdn_ppp.c
index a1e7601..69b5b58 100644
--- a/drivers/isdn/i4l/isdn_ppp.c
+++ b/drivers/isdn/i4l/isdn_ppp.c
@@ -595,7 +595,7 @@ isdn_ppp_ioctl(int min, struct file *file, unsigned int cmd, unsigned long arg)
 			j = ipc->num / (sizeof(long) * 8);
 			i = ipc->num % (sizeof(long) * 8);
 			if (j < 8)
-				protos[j] |= (0x1 << i);
+				protos[j] |= (1UL << i);
 			ipc = ipc->next;
 		}
 		if ((r = set_arg(argp, protos, 8 * sizeof(long))))
