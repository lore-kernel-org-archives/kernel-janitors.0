From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Oct 2016 20:36:24 +0000
Subject: [PATCH 4/4] AVR32-pio: Replace two seq_printf() calls by seq_puts() in pio_bank_show()
Message-Id: <87a03775-1025-8efe-3fd6-7b52491896b2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c76c4e36-3e5d-3106-69b7-907133c8b7d0@users.sourceforge.net>
In-Reply-To: <c76c4e36-3e5d-3106-69b7-907133c8b7d0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Oct 2016 22:18:31 +0200

Strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/avr32/mach-at32ap/pio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/avr32/mach-at32ap/pio.c b/arch/avr32/mach-at32ap/pio.c
index abbe1b5..7fae6ec 100644
--- a/arch/avr32/mach-at32ap/pio.c
+++ b/arch/avr32/mach-at32ap/pio.c
@@ -367,9 +367,9 @@ static void pio_bank_show(struct seq_file *s, struct gpio_chip *chip)
 			(mask & pdsr) ? "hi" : "lo",
 			(mask & pusr) ? "  " : "up");
 		if (ifsr & mask)
-			seq_printf(s, " deglitch");
+			seq_puts(s, " deglitch");
 		if ((osr & mdsr) & mask)
-			seq_printf(s, " open-drain");
+			seq_puts(s, " open-drain");
 		if (imr & mask)
 			seq_printf(s, " irq-%d edge-both",
 				gpio_to_irq(chip->base + i));
-- 
2.10.1

