From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jul 2019 12:48:03 +0000
Subject: [PATCH] staging: rtl8188eu: remove redundant assignment to rtstatus
Message-Id: <20190726124803.11349-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nishka Dasgupta <nishkadg.linux@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable rtstatus is initialized to a value that is never read and it
is re-assigned later. The initialization is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/hal/rf_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/hal/rf_cfg.c b/drivers/staging/rtl8188eu/hal/rf_cfg.c
index 739e62dc60e3..47b1bf5a6143 100644
--- a/drivers/staging/rtl8188eu/hal/rf_cfg.c
+++ b/drivers/staging/rtl8188eu/hal/rf_cfg.c
@@ -222,7 +222,7 @@ bool rtl88eu_phy_rf_config(struct adapter *adapt)
 {
 	struct hal_data_8188e *hal_data = adapt->HalData;
 	u32 u4val = 0;
-	bool rtstatus = true;
+	bool rtstatus;
 	struct bb_reg_def *pphyreg;
 
 	pphyreg = &hal_data->PHYRegDef[RF90_PATH_A];
-- 
2.20.1
