From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Jun 2012 17:05:16 +0000
Subject: [patch] Staging: rtl8187se, rtl8192e: fix '&' vs '|' bugs
Message-Id: <20120609170516.GE6488@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The original code is equivalent to:

	wrqu->retry.flags = 0x1000 & 0x0002;

so it just sets .flags to zero.  We should be ORing the values together
like r8192_wx_get_retry() does in drivers/staging/rtl8192u/r8192U_wx.c.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 778d7ba..6202358 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -919,10 +919,10 @@ static int r8192_wx_get_retry(struct net_device *dev,
 		return -EINVAL;
 
 	if (wrqu->retry.flags & IW_RETRY_MAX) {
-		wrqu->retry.flags = IW_RETRY_LIMIT & IW_RETRY_MAX;
+		wrqu->retry.flags = IW_RETRY_LIMIT | IW_RETRY_MAX;
 		wrqu->retry.value = priv->retry_rts;
 	} else {
-		wrqu->retry.flags = IW_RETRY_LIMIT & IW_RETRY_MIN;
+		wrqu->retry.flags = IW_RETRY_LIMIT | IW_RETRY_MIN;
 		wrqu->retry.value = priv->retry_data;
 	}
 	return 0;
diff --git a/drivers/staging/rtl8187se/r8180_wx.c b/drivers/staging/rtl8187se/r8180_wx.c
index 46ee6f4..52f63d7 100644
--- a/drivers/staging/rtl8187se/r8180_wx.c
+++ b/drivers/staging/rtl8187se/r8180_wx.c
@@ -615,10 +615,10 @@ static int r8180_wx_get_retry(struct net_device *dev,
 		return -EINVAL;
 
 	if (wrqu->retry.flags & IW_RETRY_MAX) {
-		wrqu->retry.flags = IW_RETRY_LIMIT & IW_RETRY_MAX;
+		wrqu->retry.flags = IW_RETRY_LIMIT | IW_RETRY_MAX;
 		wrqu->retry.value = priv->retry_rts;
 	} else {
-		wrqu->retry.flags = IW_RETRY_LIMIT & IW_RETRY_MIN;
+		wrqu->retry.flags = IW_RETRY_LIMIT | IW_RETRY_MIN;
 		wrqu->retry.value = priv->retry_data;
 	}
 
