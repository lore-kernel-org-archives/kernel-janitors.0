From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Jan 2019 08:27:47 +0000
Subject: [PATCH] pwm: imx: Signedness bug in imx_pwm_get_state()
Message-Id: <20190109082747.GA5476@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"ret" only holds zero and negative error codes.  It needs to be signed
for the error handling to work.

Fixes: 9f4c8f9607c3 ("pwm: imx: Add ipg clock operation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pwm/pwm-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-imx.c b/drivers/pwm/pwm-imx.c
index 55a3a363d5be..b8452abe2392 100644
--- a/drivers/pwm/pwm-imx.c
+++ b/drivers/pwm/pwm-imx.c
@@ -128,8 +128,9 @@ static void imx_pwm_get_state(struct pwm_chip *chip,
 		struct pwm_device *pwm, struct pwm_state *state)
 {
 	struct imx_chip *imx = to_imx_chip(chip);
-	u32 period, prescaler, pwm_clk, ret, val;
+	u32 period, prescaler, pwm_clk, val;
 	u64 tmp;
+	int ret;
 
 	ret = imx_pwm_clk_prepare_enable(chip);
 	if (ret < 0)
-- 
2.17.1
