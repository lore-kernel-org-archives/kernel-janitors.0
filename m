From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Aug 2015 00:11:22 +0000
Subject: [PATCH 11/11] gpio: xlp: fix error return code
Message-Id: <1440288682-12732-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440288682-12732-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440288682-12732-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Return a negative error code on failure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpio/gpio-xlp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 9bdab72..e02499a 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -387,7 +387,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	irq_base = irq_alloc_descs(-1, XLP_GPIO_IRQ_BASE, gc->ngpio, 0);
 	if (irq_base < 0) {
 		dev_err(&pdev->dev, "Failed to allocate IRQ numbers\n");
-		return err;
+		return -ENODEV;
 	}
 
 	err = gpiochip_add(gc);

