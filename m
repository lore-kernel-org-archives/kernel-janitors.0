From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 05 Aug 2012 09:52:34 +0000
Subject: [PATCH 4/6] drivers/gpio/gpio-langwell.c: fix error return code
Message-Id: <1344160356-387-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: kernel-janitors@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

From: Julia Lawall <julia@diku.dk>

Convert a 0 error return code to a negative one, as returned elsewhere in the
function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret;
expression e,e1,e2,e3,e4,x;
@@

(
if (\(ret != 0\|ret < 0\) || ...) { ... return ...; }
|
ret = 0
)
... when != ret = e1
*x = \(kmalloc\|kzalloc\|kcalloc\|devm_kzalloc\|ioremap\|ioremap_nocache\|devm_ioremap\|devm_ioremap_nocache\)(...);
... when != x = e2
    when != ret = e3
*if (x = NULL || ...)
{
  ... when != ret = e4
*  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpio/gpio-langwell.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-langwell.c b/drivers/gpio/gpio-langwell.c
index a1c8754..202a992 100644
--- a/drivers/gpio/gpio-langwell.c
+++ b/drivers/gpio/gpio-langwell.c
@@ -339,7 +339,7 @@ static int __devinit lnw_gpio_probe(struct pci_dev *pdev,
 	resource_size_t start, len;
 	struct lnw_gpio *lnw;
 	u32 gpio_base;
-	int retval = 0;
+	int retval;
 	int ngpio = id->driver_data;
 
 	retval = pci_enable_device(pdev);
@@ -357,6 +357,7 @@ static int __devinit lnw_gpio_probe(struct pci_dev *pdev,
 	base = ioremap_nocache(start, len);
 	if (!base) {
 		dev_err(&pdev->dev, "error mapping bar1\n");
+		retval = -EFAULT;
 		goto err3;
 	}
 	gpio_base = *((u32 *)base + 1);
@@ -381,8 +382,10 @@ static int __devinit lnw_gpio_probe(struct pci_dev *pdev,
 
 	lnw->domain = irq_domain_add_linear(pdev->dev.of_node, ngpio,
 					    &lnw_gpio_irq_ops, lnw);
-	if (!lnw->domain)
+	if (!lnw->domain) {
+		retval = -ENOMEM;
 		goto err3;
+	}
 
 	lnw->reg_base = base;
 	lnw->chip.label = dev_name(&pdev->dev);

