From: Colin King <colin.king@canonical.com>
Date: Mon, 18 May 2020 16:55:29 +0000
Subject: [PATCH][next] i2c: mediatek: fix integer overflow on an integer multiplication
Message-Id: <20200518165529.57821-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the calculation of sample_ns is using a 32 bit integer
multiplication and can potentially overflow. Fix this by making the
constant a long long to use a 64 bit multiply and hence
avoid an overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 5f1ae73d538a ("i2c: mediatek: Add i2c ac-timing adjust support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 702061805925..c93492b997ce 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -551,7 +551,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	const struct i2c_spec_values *spec;
 	unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
 	unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
-	long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
+	long long sample_ns = (1000000000LL * (sample_cnt + 1)) / clk_src;
 
 	if (!i2c->dev_comp->timing_adjust)
 		return 0;
-- 
2.25.1
