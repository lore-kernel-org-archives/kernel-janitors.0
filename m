From: Colin King <colin.king@canonical.com>
Date: Fri, 07 Jun 2019 10:45:33 +0000
Subject: [PATCH][next] clk: bcm2835: fix memork leak on unfree'd pll struct
Message-Id: <20190607104533.14700-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pll struct is being allocated but not kfree'd on an error return
path when devm_clk_hw_register fails.  Fix this with a kfree on pll
if an error occurs.

Addresses-Coverity: ("Resource leak")
Fixes: b19f009d4510 ("clk: bcm2835: Migrate to clk_hw based registration and OF APIs")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/bcm/clk-bcm2835.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 770bb01f523e..90584deaf416 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1310,8 +1310,10 @@ static struct clk_hw *bcm2835_register_pll(struct bcm2835_cprman *cprman,
 	pll->hw.init = &init;
 
 	ret = devm_clk_hw_register(cprman->dev, &pll->hw);
-	if (ret)
+	if (ret) {
+		kfree(pll);
 		return NULL;
+	}
 	return &pll->hw;
 }
 
-- 
2.20.1
