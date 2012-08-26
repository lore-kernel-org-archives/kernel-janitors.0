From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 26 Aug 2012 16:00:55 +0000
Subject: [PATCH 3/13] drivers/gpio/gpio-pxa.c: use clk_prepare_enable and clk_disable_unprepare
Message-Id: <1345996865-32082-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: kernel-janitors@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Clk_prepare_enable and clk_disable_unprepare combine clk_prepare and
clk_enable, and clk_disable and clk_unprepare.  They make the code more
concise, and ensure that clk_unprepare is called when clk_enable fails.

A simplified version of the semantic patch that introduces calls to these
functions is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
@@

- clk_prepare(e);
- clk_enable(e);
+ clk_prepare_enable(e);

@@
expression e;
@@

- clk_disable(e);
- clk_unprepare(e);
+ clk_disable_unprepare(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpio/gpio-pxa.c |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 9528779..bd8fb66 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -589,19 +589,12 @@ static int __devinit pxa_gpio_probe(struct platform_device *pdev)
 		iounmap(gpio_reg_base);
 		return PTR_ERR(clk);
 	}
-	ret = clk_prepare(clk);
+	ret = clk_prepare_enable(clk);
 	if (ret) {
 		clk_put(clk);
 		iounmap(gpio_reg_base);
 		return ret;
 	}
-	ret = clk_enable(clk);
-	if (ret) {
-		clk_unprepare(clk);
-		clk_put(clk);
-		iounmap(gpio_reg_base);
-		return ret;
-	}
 
 	/* Initialize GPIO chips */
 	info = dev_get_platdata(&pdev->dev);

