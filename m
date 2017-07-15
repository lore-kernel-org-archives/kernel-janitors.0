From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 15 Jul 2017 20:07:40 +0000
Subject: [PATCH 05/11] irqchip/gic/realview: Drop unnecessary static
Message-Id: <1500149266-32357-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org

Drop static on a local variable, when the variable is initialized before
any possible use.  Thus, the static has no benefit.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@bad exists@
position p;
identifier x;
type T;
@@
static T x@p;
...
x = <+...x...+>

@@
identifier x;
expression e;
type T;
position p != bad.p;
@@
-static
 T x@p;
 ... when != x
     when strict
?x = e;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
These patches are all independent of each other.

 drivers/irqchip/irq-gic-realview.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/irqchip/irq-gic-realview.c b/drivers/irqchip/irq-gic-realview.c
--- a/drivers/irqchip/irq-gic-realview.c
+++ b/drivers/irqchip/irq-gic-realview.c
@@ -43,7 +43,7 @@ static const struct of_device_id syscon_
 static int __init
 realview_gic_of_init(struct device_node *node, struct device_node *parent)
 {
-	static struct regmap *map;
+	struct regmap *map;
 	struct device_node *np;
 	const struct of_device_id *gic_id;
 	u32 pld1_ctrl;

