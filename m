From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Apr 2019 12:08:22 +0000
Subject: [PATCH] staging: rtlwifi: fix spelling mistake "notity" -> "notify"
Message-Id: <20190417120822.21771-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510150741.20677-1-colin.king@canonical.com>
In-Reply-To: <20180510150741.20677-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistake in RT_TRACE messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/btcoexist/halbtc8822b1ant.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtlwifi/btcoexist/halbtc8822b1ant.c b/drivers/staging/rtlwifi/btcoexist/halbtc8822b1ant.c
index ade271cb4aab..32c797430512 100644
--- a/drivers/staging/rtlwifi/btcoexist/halbtc8822b1ant.c
+++ b/drivers/staging/rtlwifi/btcoexist/halbtc8822b1ant.c
@@ -4730,7 +4730,7 @@ void ex_btc8822b1ant_media_status_notify(struct btc_coexist *btcoexist, u8 type)
 		if (wifi_under_b_mode) {
 			RT_TRACE(
 				rtlpriv, COMP_BT_COEXIST, DBG_LOUD,
-				"[BTCoex], ********** (media status notity under b mode) **********\n");
+				"[BTCoex], ********** (media status notify under b mode) **********\n");
 			btcoexist->btc_write_1byte(btcoexist, 0x6cd,
 						   0x00); /* CCK Tx */
 			btcoexist->btc_write_1byte(btcoexist, 0x6cf,
@@ -4738,7 +4738,7 @@ void ex_btc8822b1ant_media_status_notify(struct btc_coexist *btcoexist, u8 type)
 		} else {
 			RT_TRACE(
 				rtlpriv, COMP_BT_COEXIST, DBG_LOUD,
-				"[BTCoex], ********** (media status notity not under b mode) **********\n");
+				"[BTCoex], ********** (media status notify not under b mode) **********\n");
 			btcoexist->btc_write_1byte(btcoexist, 0x6cd,
 						   0x00); /* CCK Tx */
 			btcoexist->btc_write_1byte(btcoexist, 0x6cf,
-- 
2.20.1
