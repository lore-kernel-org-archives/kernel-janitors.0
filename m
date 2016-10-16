From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Oct 2016 20:35:33 +0000
Subject: [PATCH 3/4] AVR32-pio: Use seq_putc() in pio_bank_show()
Message-Id: <435dfeda-04e6-7eb1-4881-9a84890e817c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c76c4e36-3e5d-3106-69b7-907133c8b7d0@users.sourceforge.net>
In-Reply-To: <c76c4e36-3e5d-3106-69b7-907133c8b7d0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Oct 2016 22:13:19 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/avr32/mach-at32ap/pio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/avr32/mach-at32ap/pio.c b/arch/avr32/mach-at32ap/pio.c
index 13d3fc4..abbe1b5 100644
--- a/arch/avr32/mach-at32ap/pio.c
+++ b/arch/avr32/mach-at32ap/pio.c
@@ -373,7 +373,7 @@ static void pio_bank_show(struct seq_file *s, struct gpio_chip *chip)
 		if (imr & mask)
 			seq_printf(s, " irq-%d edge-both",
 				gpio_to_irq(chip->base + i));
-		seq_printf(s, "\n");
+		seq_putc(s, '\n');
 	}
 }
 
-- 
2.10.1

