From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jul 2020 16:15:41 +0000
Subject: [PATCH] mfd: max14577: remove redundant initialization of variable current_bits
Message-Id: <20200723161541.994669-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable current_bits is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mfd/max14577.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index fd8864cafd25..be185e9d5f16 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -61,7 +61,7 @@ EXPORT_SYMBOL_GPL(maxim_charger_currents);
 int maxim_charger_calc_reg_current(const struct maxim_charger_current *limits,
 		unsigned int min_ua, unsigned int max_ua, u8 *dst)
 {
-	unsigned int current_bits = 0xf;
+	unsigned int current_bits;
 
 	if (min_ua > max_ua)
 		return -EINVAL;
-- 
2.27.0
