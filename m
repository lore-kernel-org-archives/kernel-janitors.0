From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Sep 2019 09:51:26 +0000
Subject: [PATCH] counter: stm32: clean up indentation issue
Message-Id: <20190925095126.20219-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabrice Gasnier <fabrice.gasnier@st.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an if statement that is indented one level too deeply,
remove the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/counter/stm32-timer-cnt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 644ba18a72ad..613dcccf79e1 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -219,8 +219,8 @@ static ssize_t stm32_count_enable_write(struct counter_device *counter,
 
 	if (enable) {
 		regmap_read(priv->regmap, TIM_CR1, &cr1);
-			if (!(cr1 & TIM_CR1_CEN))
-				clk_enable(priv->clk);
+		if (!(cr1 & TIM_CR1_CEN))
+			clk_enable(priv->clk);
 
 		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
 				   TIM_CR1_CEN);
-- 
2.20.1
