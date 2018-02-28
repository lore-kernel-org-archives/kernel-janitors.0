From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Feb 2018 11:28:49 +0000
Subject: [PATCH] staging: rtl8192u: return -ENOMEM on failed allocation of priv->oldaddr
Message-Id: <20180228112849.16327-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the allocation of priv->oldaddr is not null checked which will
lead to subsequent errors when accessing priv->oldaddr.  Fix this with
a null pointer check and a return of -ENOMEM on allocation failure.

Detected with Coccinelle:
drivers/staging/rtl8192u/r8192U_core.c:1708:2-15: alloc with no test,
possible model on line 1723

Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 3c300f7b6a62..d607c59761cf 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -1706,6 +1706,8 @@ static short rtl8192_usb_initendpoints(struct net_device *dev)
 
 		priv->rx_urb[16] = usb_alloc_urb(0, GFP_KERNEL);
 		priv->oldaddr = kmalloc(16, GFP_KERNEL);
+		if (!priv->oldaddr)
+			return -ENOMEM;
 		oldaddr = priv->oldaddr;
 		align = ((long)oldaddr) & 3;
 		if (align) {
-- 
2.15.1

