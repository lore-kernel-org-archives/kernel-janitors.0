From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Mar 2020 08:58:36 +0000
Subject: [PATCH] ARM: davinci: dm646x-evm: Simplify error handling in 'evm_sw_setup()'
Message-Id: <20200321085836.16493-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nsekhar@ti.com, bgolaszewski@baylibre.com, linux@armlinux.org.uk
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

There is no need to call 'gpio_free(evm_sw_gpio[i])' for these error
handling cases, it is already done in the error handling path at label
'out_free'.

Simplify the code and axe a few LoC.

While at it, also explicitly return 0 in the normal path.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The code after 'out_free' could also be replace by a single
'evm_sw_teardown()' call, but I'm not a big fan of such construction.

In 'evm_sw_teardown()', the 'gpio_unexport()' call could also be removed
because it is implied by 'gpio_free()'.

Let me now if interested for one or both of these additional clean-up.
---
 arch/arm/mach-davinci/board-dm646x-evm.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index 4600b617f9b4..dd7d60f4139a 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -267,20 +267,15 @@ static int evm_sw_setup(struct i2c_client *client, int gpio,
 		evm_sw_gpio[i] = gpio++;
 
 		status = gpio_direction_input(evm_sw_gpio[i]);
-		if (status) {
-			gpio_free(evm_sw_gpio[i]);
-			evm_sw_gpio[i] = -EINVAL;
+		if (status)
 			goto out_free;
-		}
 
 		status = gpio_export(evm_sw_gpio[i], 0);
-		if (status) {
-			gpio_free(evm_sw_gpio[i]);
-			evm_sw_gpio[i] = -EINVAL;
+		if (status)
 			goto out_free;
-		}
 	}
-	return status;
+	return 0;
+
 out_free:
 	for (i = 0; i < 4; ++i) {
 		if (evm_sw_gpio[i] != -EINVAL) {
-- 
2.20.1
