From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Feb 2018 15:00:08 +0000
Subject: [PATCH] staging: rtl8723bs: fix u8 less than zero check
Message-Id: <20180223150008.30124-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error variable ret is currently a u8 and so two comparisons
to see if an error return is less than zero will always be false
because ret is unsigned.  Fix this by making ret an int.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 51d48de24a24..1e6c587e4550 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -3255,7 +3255,7 @@ static int cfg80211_rtw_sched_scan_start(struct wiphy *wiphy,
 
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct	mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	u8 ret;
+	int ret;
 
 	if (padapter->bup = false) {
 		DBG_871X("%s: net device is down.\n", __func__);
-- 
2.15.1

