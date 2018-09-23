From: Colin King <colin.king@canonical.com>
Date: Sun, 23 Sep 2018 09:25:55 +0000
Subject: [PATCH] staging: rtl8188eu, rtl8723bs: fix spelling mistake "evet" -> "event"
Message-Id: <20180923092555.6316-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in RT_TRACE message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/core/rtw_mlme.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
index ef8a7dc4bd34..9a3532de6523 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
@@ -540,7 +540,7 @@ static int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *
 /* TODO: Perry: For Power Management */
 void rtw_atimdone_event_callback(struct adapter *adapter, u8 *pbuf)
 {
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("receive atimdone_evet\n"));
+	RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("receive atimdone_event\n"));
 }
 
 void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f9392b8db49b..4c5d5cf9dfe0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -802,7 +802,7 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 /* TODO: Perry : For Power Management */
 void rtw_atimdone_event_callback(struct adapter	*adapter, u8 *pbuf)
 {
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("receive atimdone_evet\n"));
+	RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("receive atimdone_event\n"));
 }
 
 
-- 
2.17.1
