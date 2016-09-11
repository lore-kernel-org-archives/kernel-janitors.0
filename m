From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Sep 2016 12:14:40 +0000
Subject: [PATCH 4/6] pinctrl: stm32: constify gpio_chip structures
Message-Id: <1473596082-32690-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473596082-32690-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1473596082-32690-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

These structures are only used to copy into other structures, so declare
them as const.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct gpio_chip i@p = { ... };

@ok@
identifier r.i;
expression e;
position p;
@@
e = i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct gpio_chip e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct gpio_chip i = { ... };
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/stm32/pinctrl-stm32.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 4ae596b..6d92351 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -174,7 +174,7 @@ static int stm32_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static struct gpio_chip stm32_gpio_template = {
+static const struct gpio_chip stm32_gpio_template = {
 	.request		= stm32_gpio_request,
 	.free			= stm32_gpio_free,
 	.get			= stm32_gpio_get,

