From: Colin King <colin.king@canonical.com>
Date: Wed, 22 May 2019 08:26:27 +0000
Subject: [PATCH][next] leds: TI LMU: remove redundant u8 comparisons with less than zero
Message-Id: <20190522082627.18354-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The u8 variables ramp_up and ramp_down are being compared to less
than zero, this will always be false. Code is redundant so remove
it.

Addresses-Coverity: ("Unsigned compared against 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-ti-lmu-common.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
index adc7293004f1..6db47accfe62 100644
--- a/drivers/leds/leds-ti-lmu-common.c
+++ b/drivers/leds/leds-ti-lmu-common.c
@@ -94,9 +94,6 @@ int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
 		ramp_down = ti_lmu_common_convert_ramp_to_index(lmu_bank->ramp_down_usec);
 	}
 
-	if (ramp_up < 0 || ramp_down < 0)
-		return -EINVAL;
-
 	ramp = (ramp_up << 4) | ramp_down;
 
 	return regmap_write(regmap, lmu_bank->runtime_ramp_reg, ramp);
-- 
2.20.1
