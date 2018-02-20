From: Christopher Diaz Riveros <chrisadr@gentoo.org>
Date: Tue, 20 Feb 2018 16:37:22 +0000
Subject: [PATCH-next] staging: rtl8188eu: Remove unneeded cast
Message-Id: <20180220163722.14694-1-chrisadr@gentoo.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix Coccinelle alert:

drivers/staging//rtl8188eu/os_dep/usb_intf.c:336:13-27: WARNING: casting value returned by memory allocation function to (struct adapter *) is useless.

This issue was detected by using the Coccinelle software.

Signed-off-by: Christopher Diaz Riveros <chrisadr@gentoo.org>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index 32c7225a831e..127ecf896fc9 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -333,7 +333,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	struct net_device *pmondev;
 	int status = _FAIL;
 
-	padapter = (struct adapter *)vzalloc(sizeof(*padapter));
+	padapter = vzalloc(sizeof(*padapter));
 	if (padapter = NULL)
 		goto exit;
 	padapter->dvobj = dvobj;
-- 
2.16.2

