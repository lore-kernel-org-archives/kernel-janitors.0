From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jan 2018 13:52:55 +0000
Subject: [PATCH] staging: rtlwifi: remove redundant initialization of 'cfg_cmd'
Message-Id: <20180126135255.18539-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171108133031.26562-1-colin.king@canonical.com>
In-Reply-To: <20171108133031.26562-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ping-Ke Shih <pkshih@realtek.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The initialization of cfg_cmd is redundant as the value is never read
and it is being re-assigned to cfg_cmd = pwrcfgcmd[ary_idx] inside a
loop, hence it can be removed.

Cleans up clang warning:
drivers/staging/rtlwifi/core.c:1819:22: warning: Value stored to
'cfg_cmd' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/core.c b/drivers/staging/rtlwifi/core.c
index a43d37452e8b..3ec039498208 100644
--- a/drivers/staging/rtlwifi/core.c
+++ b/drivers/staging/rtlwifi/core.c
@@ -1816,7 +1816,7 @@ bool rtl_hal_pwrseqcmdparsing(struct rtl_priv *rtlpriv, u8 cut_version,
 			      u8 faversion, u8 interface_type,
 			      struct wlan_pwr_cfg pwrcfgcmd[])
 {
-	struct wlan_pwr_cfg cfg_cmd = {0};
+	struct wlan_pwr_cfg cfg_cmd;
 	bool polling_bit = false;
 	u32 ary_idx = 0;
 	u8 value = 0;
-- 
2.15.1

