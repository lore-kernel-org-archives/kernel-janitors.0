From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 Sep 2017 07:51:17 +0000
Subject: [PATCH 1/2] staging: rtlwifi: silence underflow warning
Message-Id: <20170929075117.cno3vnrebea32upt@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I'm not totally certain that it's necessary to put an upper limit here.
I think it happens at lower levels.  But if we are going to do that then
we should have a lower bound as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtlwifi/core.c b/drivers/staging/rtlwifi/core.c
index 43b8b9efe25f..b55e18304a60 100644
--- a/drivers/staging/rtlwifi/core.c
+++ b/drivers/staging/rtlwifi/core.c
@@ -412,7 +412,8 @@ static void _rtl_add_wowlan_patterns(struct ieee80211_hw *hw,
 	for (i = 0; i < wow->n_patterns; i++) {
 		memset(&rtl_pattern, 0, sizeof(struct rtl_wow_pattern));
 		memset(mask, 0, MAX_WOL_BIT_MASK_SIZE);
-		if (patterns[i].pattern_len > MAX_WOL_PATTERN_SIZE) {
+		if (patterns[i].pattern_len < 0 ||
+		    patterns[i].pattern_len > MAX_WOL_PATTERN_SIZE) {
 			RT_TRACE(rtlpriv, COMP_POWER, DBG_WARNING,
 				 "Pattern[%d] is too long\n", i);
 			continue;
