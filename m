From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Oct 2017 10:11:37 +0000
Subject: [PATCH] pinctrl: ingenic: make function ingenic_pinctrl_probe static
Message-Id: <20171005101137.29664-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function ingenic_pinctrl_probe is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warnings
symbol 'ingenic_pinctrl_probe' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d84761822243..372ddf386bdb 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -717,7 +717,7 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{},
 };
 
-int ingenic_pinctrl_probe(struct platform_device *pdev)
+static int ingenic_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct ingenic_pinctrl *jzpc;
-- 
2.14.1

