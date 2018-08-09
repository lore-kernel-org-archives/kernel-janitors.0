From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Aug 2018 10:51:20 +0000
Subject: [PATCH] staging: rtl8712: remove unused array iw_operation_mode
Message-Id: <20180809105120.29019-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Homuth <martin@martinhomuth.de>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array iw_operation_mode is defined but is never used hence it is
redundant and can be removed. This array has been like this since
the driver was added back in 2010

Cleans up clang warning:
warning: 'iw_operation_mode' defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8712/rtl871x_ioctl_linux.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
index c3ff7c3e6681..12af6f4baa48 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
@@ -67,11 +67,6 @@ static const long ieee80211_wlan_frequencies[] = {
 	2472, 2484
 };
 
-static const char * const iw_operation_mode[] = {
-	"Auto", "Ad-Hoc", "Managed",  "Master", "Repeater", "Secondary",
-	 "Monitor"
-};
-
 void r8712_indicate_wx_assoc_event(struct _adapter *padapter)
 {
 	union iwreq_data wrqu;
-- 
2.17.1

