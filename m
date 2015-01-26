From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Mon, 26 Jan 2015 15:39:14 +0000
Subject: [PATCH] staging: rtl8188eu: core: rtw_wlan_util.c: Fix for NULL dereference
Message-Id: <1422286754-3039-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: navin.patidar@gmail.com, Larry.Finger@lwfinger.net, dan.carpenter@oracle.com, tapaswenipathak@gmail.com, abelmoyo.ab@gmail.com, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

In rtw_check_bcn_info(), check the return value of kzalloc() before
dereferencing it, to avoid NULL pointer dereference.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_wlan_util.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c b/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
index 3e9b6e9..a3ffc69 100644
--- a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
@@ -931,6 +931,8 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	}
 
 	bssid = kzalloc(sizeof(struct wlan_bssid_ex), GFP_ATOMIC);
+	if (!bssid)
+		return _FAIL;
 
 	subtype = GetFrameSubType(pframe) >> 4;
 
-- 
2.1.0

