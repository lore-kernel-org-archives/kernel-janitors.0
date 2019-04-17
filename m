From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Apr 2019 12:00:47 +0000
Subject: [PATCH] staging: rtl8723bs: fix spelling mistake: "nonprintabl" -> "non-printable"
Message-Id: <20190417120047.20015-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170411131708.20268-1-colin.king@canonical.com>
In-Reply-To: <20170411131708.20268-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an RT_TRACE message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 0c8a050b2a81..bd75bca1ac6e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -44,7 +44,7 @@ u8 rtw_validate_ssid(struct ndis_802_11_ssid *ssid)
 	for (i = 0; i < ssid->SsidLength; i++) {
 		/* wifi, printable ascii code must be supported */
 		if (!((ssid->Ssid[i] >= 0x20) && (ssid->Ssid[i] <= 0x7e))) {
-			RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_err_, ("ssid has nonprintabl ascii\n"));
+			RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_err_, ("ssid has non-printable ascii\n"));
 			ret = false;
 			break;
 		}
-- 
2.20.1
