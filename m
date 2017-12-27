From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 14:51:40 +0000
Subject: [PATCH 07/12] ARM: davinci: drop unneeded newline
Message-Id: <1514386305-7402-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

gpio_request uses its second argument as a label, so it doesn't seem
appropriate for it to have a newline.  Done using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/arm/mach-davinci/board-da850-evm.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index cbde003..d898a94 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -798,11 +798,11 @@ static int da850_lcd_hw_init(void)
 {
 	int status;
 
-	status = gpio_request(DA850_LCD_BL_PIN, "lcd bl\n");
+	status = gpio_request(DA850_LCD_BL_PIN, "lcd bl");
 	if (status < 0)
 		return status;
 
-	status = gpio_request(DA850_LCD_PWR_PIN, "lcd pwr\n");
+	status = gpio_request(DA850_LCD_PWR_PIN, "lcd pwr");
 	if (status < 0) {
 		gpio_free(DA850_LCD_BL_PIN);
 		return status;

