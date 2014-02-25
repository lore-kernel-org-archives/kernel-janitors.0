From: Silvan Jegen <s.jegen@gmail.com>
Date: Tue, 25 Feb 2014 17:07:10 +0000
Subject: [PATCH] Staging: rtl8192e: Replace min macro with min_t
Message-Id: <530cd6bf.c45a0f0a.7c86.ffffd79d@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org

Instead of an explicit cast the min_t macro should be used.

Signed-off-by: Silvan Jegen <s.jegen@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 6202358..498995d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -609,7 +609,7 @@ static int r8192_wx_set_nick(struct net_device *dev,
 	if (wrqu->data.length > IW_ESSID_MAX_SIZE)
 		return -E2BIG;
 	down(&priv->wx_sem);
-	wrqu->data.length = min((size_t) wrqu->data.length, sizeof(priv->nick));
+	wrqu->data.length = min_t(size_t, wrqu->data.length, sizeof(priv->nick));
 	memset(priv->nick, 0, sizeof(priv->nick));
 	memcpy(priv->nick, extra, wrqu->data.length);
 	up(&priv->wx_sem);
-- 
1.9.0

