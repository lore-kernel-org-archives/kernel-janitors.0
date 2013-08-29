From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Aug 2013 21:45:42 +0000
Subject: [patch 1/2] staging: rtl8188eu: off by one in rtw_set_802_11_add_wep()
Message-Id: <20130829214542.GB23197@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"keyid" is used as an offset into the ->dot11DefKey[] array.  The array
has 4 elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
index 9e12774..5fab477 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
@@ -566,7 +566,7 @@ _func_enter_;
 
 	keyid = wep->KeyIndex & 0x3fffffff;
 
-	if (keyid > 4) {
+	if (keyid >= 4) {
 		RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_err_, ("MgntActrtw_set_802_11_add_wep:keyid>4 =>fail\n"));
 		ret = false;
 		goto exit;
