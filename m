From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Aug 2018 13:20:32 +0000
Subject: [PATCH] misc: bh1770glc: remove unused array prox_curr_ma
Message-Id: <20180807132032.1827-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array prox_curr_ma is declared but never used, hence it is redundant
and can be removed.

Cleans up clang warning:
warning: 'prox_curr_ma' defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/bh1770glc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/misc/bh1770glc.c b/drivers/misc/bh1770glc.c
index 9c62bf064f77..17e81ce9925b 100644
--- a/drivers/misc/bh1770glc.c
+++ b/drivers/misc/bh1770glc.c
@@ -180,9 +180,6 @@ static const char reg_vleds[] = "Vleds";
 static const s16 prox_rates_hz[] = {100, 50, 33, 25, 14, 10, 5, 2};
 static const s16 prox_rates_ms[] = {10, 20, 30, 40, 70, 100, 200, 500};
 
-/* Supported IR-led currents in mA */
-static const u8 prox_curr_ma[] = {5, 10, 20, 50, 100, 150, 200};
-
 /*
  * Supported stand alone rates in ms from chip data sheet
  * {100, 200, 500, 1000, 2000};
-- 
2.17.1

