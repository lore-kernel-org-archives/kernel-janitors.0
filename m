From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Jan 2018 11:20:01 +0000
Subject: [PATCH] staging: rtl8188eu: remove redundant initialization of 'pwrcfgcmd'
Message-Id: <20180123112001.32056-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Structure pwrcfgcmd is being zero'd at initialization however this
value is never read as few statements later in a loop it is being
assigned a new value, hence the initialization is redundant and
can be removed.

Cleans up clang warning:
drivers/staging/rtl8188eu/hal/pwrseqcmd.c:25:20: warning: Value stored
to 'pwrcfgcmd' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/hal/pwrseqcmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/hal/pwrseqcmd.c b/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
index 2867864bbfbe..e6867eea3530 100644
--- a/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
+++ b/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
@@ -22,7 +22,7 @@
 u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, u8 cut_vers,
 			    struct wl_pwr_cfg pwrseqcmd[])
 {
-	struct wl_pwr_cfg pwrcfgcmd = {0};
+	struct wl_pwr_cfg pwrcfgcmd;
 	u8 poll_bit = false;
 	u32 aryidx = 0;
 	u8 value = 0;
-- 
2.15.1

