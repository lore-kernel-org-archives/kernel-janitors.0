From: Marcos Paulo de Souza <marcos.mage@gmail.com>
Date: Wed, 09 Nov 2011 20:38:57 +0000
Subject: [PATCH 2/2] drivers/staging/vt6656/iwctl.c: Remove unnecessary function
Message-Id: <1320871137-2782-1-git-send-email-marcos.mage@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed the function iwctl_giwnwid, that was used once. Removed too a
switch/case statement that was ambiguous.

Signed-off-by: Marcos Paulo de Souza <marcos.mage@gmail.com>
---
 drivers/staging/vt6656/iwctl.c    |   11 -----------
 drivers/staging/vt6656/iwctl.h    |    5 -----
 drivers/staging/vt6656/main_usb.c |    9 +--------
 3 files changed, 1 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/vt6656/iwctl.c b/drivers/staging/vt6656/iwctl.c
index 8c1ca49..a9110bf 100644
--- a/drivers/staging/vt6656/iwctl.c
+++ b/drivers/staging/vt6656/iwctl.c
@@ -127,17 +127,6 @@ int iwctl_giwname(struct net_device *dev,
 	return 0;
 }
 
-int iwctl_giwnwid(struct net_device *dev,
-             struct iw_request_info *info,
-			 struct iw_param *wrq,
-                   char *extra)
-{
- 	//wrq->value = 0x100;
-	//wrq->disabled = 0;
-	//wrq->fixed = 1;
-	//return 0;
-  return -EOPNOTSUPP;
-}
 /*
  * Wireless Handler : set scan
  */
diff --git a/drivers/staging/vt6656/iwctl.h b/drivers/staging/vt6656/iwctl.h
index cc48954..10a240e 100644
--- a/drivers/staging/vt6656/iwctl.h
+++ b/drivers/staging/vt6656/iwctl.h
@@ -77,11 +77,6 @@ int iwctl_giwname(struct net_device *dev,
 			 char *wrq,
 			 char *extra);
 
-int iwctl_giwnwid(struct net_device *dev,
-             struct iw_request_info *info,
-			 struct iw_param *wrq,
-                   char *extra) ;
-
 int iwctl_giwsens(struct net_device *dev,
 			 struct iw_request_info *info,
 			 struct iw_param *wrq,
diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index 27521b6..6f9930a 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -1618,15 +1618,8 @@ static int  device_ioctl(struct net_device *dev, struct ifreq *rq, int cmd) {
 		break;
 
 	case SIOCSIWNWID:
-        rc = -EOPNOTSUPP;
-		break;
-
 	case SIOCGIWNWID:     //0x8b03  support
-	#ifdef  WPA_SUPPLICANT_DRIVER_WEXT_SUPPORT
-          rc = iwctl_giwnwid(dev, NULL, &(wrq->u.nwid), NULL);
-	#else
-        rc = -EOPNOTSUPP;
-	#endif
+		rc = -EOPNOTSUPP;
 		break;
 
 		// Set frequency/channel
-- 
1.7.4.4

