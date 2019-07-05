From: Colin King <colin.king@canonical.com>
Date: Fri, 05 Jul 2019 08:51:32 +0000
Subject: [PATCH] [media] stv0900_core: remove redundant assignment to variables mclk, div and ad_div
Message-Id: <20190705085132.16237-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variables mclk, div and ad_div are being assigned with a values
that are never read and are being updated later with a new values.
The assignments are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/stv0900_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stv0900_core.c b/drivers/media/dvb-frontends/stv0900_core.c
index 0c50740e7bb8..7d93a1617e86 100644
--- a/drivers/media/dvb-frontends/stv0900_core.c
+++ b/drivers/media/dvb-frontends/stv0900_core.c
@@ -270,7 +270,7 @@ static enum fe_stv0900_error stv0900_initialize(struct stv0900_internal *intp)
 
 static u32 stv0900_get_mclk_freq(struct stv0900_internal *intp, u32 ext_clk)
 {
-	u32 mclk = 90000000, div = 0, ad_div = 0;
+	u32 mclk, div, ad_div;
 
 	div = stv0900_get_bits(intp, F0900_M_DIV);
 	ad_div = ((stv0900_get_bits(intp, F0900_SELX1RATIO) = 1) ? 4 : 6);
-- 
2.20.1
