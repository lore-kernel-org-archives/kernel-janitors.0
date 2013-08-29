From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Aug 2013 21:46:14 +0000
Subject: [patch 2/2] staging: rtl8188eu: || vs && typo
Message-Id: <20130829214614.GC23197@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Obviously it's impossible for ->KeyLength to be both 5 and 13.  I assume
that && was intended here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
index 5fab477..193f641 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
@@ -743,7 +743,7 @@ _func_enter_;
 
 		/*  Check key length for WEP. For NDTEST, 2005.01.27, by rcnjko. */
 		if ((encryptionalgo = _WEP40_ || encryptionalgo = _WEP104_) &&
-		    (key->KeyLength != 5 || key->KeyLength != 13)) {
+		    (key->KeyLength != 5 && key->KeyLength != 13)) {
 			RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_err_, ("WEP KeyLength:0x%x != 5 or 13\n", key->KeyLength));
 			ret = _FAIL;
 			goto exit;
