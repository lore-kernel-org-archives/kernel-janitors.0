From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Feb 2014 22:38:03 +0000
Subject: [patch 1/2] staging: r8188eu: array overflow in rtw_mp_ioctl_hdl()
Message-Id: <20140203223803.GA28874@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

MAX_MP_IOCTL_SUBCODE (35) and mp_ioctl_hdl (32 elements) are no longer
in sync.  It leads to a bogus pointer dereference.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
index dec992569476..684bc8107a48 100644
--- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
@@ -2500,7 +2500,7 @@ static int rtw_mp_ioctl_hdl(struct net_device *dev, struct iw_request_info *info
 		 ("rtw_mp_ioctl_hdl: subcode [%d], len[%d], buffer_len[%d]\r\n",
 		  poidparam->subcode, poidparam->len, len));
 
-	if (poidparam->subcode >= MAX_MP_IOCTL_SUBCODE) {
+	if (poidparam->subcode >= ARRAY_SIZE(mp_ioctl_hdl)) {
 		RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_err_, ("no matching drvext subcodes\r\n"));
 		ret = -EINVAL;
 		goto _rtw_mp_ioctl_hdl_exit;
