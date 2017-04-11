From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Apr 2017 13:17:08 +0000
Subject: [PATCH] staging: rtl8723bs: fix spelling mistake: "acquire"
Message-Id: <20170411131708.20268-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Hans de Goede <hdegoede@redhat.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in pr_info message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index d40ad03e99a3..06d8747d17c8 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -404,7 +404,7 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 #endif /*  CONFIG_WOWLAN */
 		fwfilepath = "rtlwifi/rtl8723bs_nic.bin";
 
-	pr_info("rtl8723bs: accquire FW from file:%s\n", fwfilepath);
+	pr_info("rtl8723bs: acquire FW from file:%s\n", fwfilepath);
 
 	rtStatus = request_firmware(&fw, fwfilepath, device);
 	if (rtStatus) {
-- 
2.11.0

