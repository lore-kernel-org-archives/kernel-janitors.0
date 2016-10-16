From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Oct 2016 20:32:06 +0000
Subject: [PATCH 0/4] AVR32-AT32AP: Fine-tuning for three function implementations
Message-Id: <c76c4e36-3e5d-3106-69b7-907133c8b7d0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Oct 2016 22:30:22 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  clock: Use seq_putc() in two functions
  clock: Combine nine seq_printf() calls into one call in clk_show()
  pio: Use seq_putc() in pio_bank_show()
  pio: Replace two seq_printf() calls by seq_puts() in pio_bank_show()

 arch/avr32/mach-at32ap/clock.c | 33 +++++++++++++++++++++------------
 arch/avr32/mach-at32ap/pio.c   |  6 +++---
 2 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.10.1

