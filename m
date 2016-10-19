From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 20:44:52 +0000
Subject: [PATCH 0/5] Blackfin: Fine-tuning for three function implementations
Message-Id: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Steven Miao <realmz6@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 22:24:22 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  cplbinfo: Use seq_puts() in cplbinfo_print_header()
  irqchip: Combine two seq_printf() calls into one call in arch_show_interrupts()
  setup: Use seq_putc() in show_cpuinfo()
  setup: Replace three seq_printf() calls by seq_puts() in show_cpuinfo()
  setup: Combine ten seq_printf() calls into three calls in show_cpuinfo()

 arch/blackfin/kernel/cplbinfo.c |  3 +-
 arch/blackfin/kernel/irqchip.c  |  6 ++--
 arch/blackfin/kernel/setup.c    | 73 ++++++++++++++++++++++-------------------
 3 files changed, 46 insertions(+), 36 deletions(-)

-- 
2.10.1

