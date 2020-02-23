From: Colin King <colin.king@canonical.com>
Date: Sun, 23 Feb 2020 15:18:58 +0000
Subject: [PATCH] staging: rtl8188eu: remove redundant assignment to cond
Message-Id: <20200223151858.416499-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable cond is initialized to a value that is never read and it
is re-assigned later. The initialization is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/hal/rf_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/hal/rf_cfg.c b/drivers/staging/rtl8188eu/hal/rf_cfg.c
index 47b1bf5a6143..004e19301eae 100644
--- a/drivers/staging/rtl8188eu/hal/rf_cfg.c
+++ b/drivers/staging/rtl8188eu/hal/rf_cfg.c
@@ -15,7 +15,7 @@ static bool check_condition(struct adapter *adapt, const u32  condition)
 	u32 _board = odm->BoardType;
 	u32 _platform = odm->SupportPlatform;
 	u32 _interface = odm->SupportInterface;
-	u32 cond = condition;
+	u32 cond;
 
 	if (condition = 0xCDCDCDCD)
 		return true;
-- 
2.25.0
