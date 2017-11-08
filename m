From: Colin King <colin.king@canonical.com>
Date: Wed, 08 Nov 2017 13:30:31 +0000
Subject: [PATCH] staging: rtlwifi: remove redundant assignments to ul_enc_algo
Message-Id: <20171108133031.26562-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ul_enc_algo is being initialized with a value that is never
read, it is being set again in the following switch statements in
all of the case and default paths. Hence the unitialization is
redundant and can be removed.  Cleans up two clang warnings:

Value stored to 'ul_enc_algo' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/cam.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtlwifi/cam.c b/drivers/staging/rtlwifi/cam.c
index 9c8c907cb48e..ca1c9e36d976 100644
--- a/drivers/staging/rtlwifi/cam.c
+++ b/drivers/staging/rtlwifi/cam.c
@@ -181,7 +181,7 @@ void rtl_cam_mark_invalid(struct ieee80211_hw *hw, u8 uc_index)
 
 	u32 ul_command;
 	u32 ul_content;
-	u32 ul_enc_algo = rtlpriv->cfg->maps[SEC_CAM_AES];
+	u32 ul_enc_algo;
 
 	switch (rtlpriv->sec.pairwise_enc_algorithm) {
 	case WEP40_ENCRYPTION:
@@ -221,7 +221,7 @@ void rtl_cam_empty_entry(struct ieee80211_hw *hw, u8 uc_index)
 
 	u32 ul_command;
 	u32 ul_content;
-	u32 ul_encalgo = rtlpriv->cfg->maps[SEC_CAM_AES];
+	u32 ul_encalgo;
 	u8 entry_i;
 
 	switch (rtlpriv->sec.pairwise_enc_algorithm) {
-- 
2.14.1

