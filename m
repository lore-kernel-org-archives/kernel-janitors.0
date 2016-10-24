From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 12:26:24 +0000
Subject: [PATCH 0/4] MIPS-kernel: Fine-tuning for two function implementations
Message-Id: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 14:05:14 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  r2-to-r6-emul: Use seq_puts() in mipsr2_stats_show()
  proc: Use seq_putc() in show_cpuinfo()
  proc: Replace 28 seq_printf() calls by seq_puts() in show_cpuinfo()
  proc: Combine four seq_printf() calls into one call in show_cpuinfo()

 arch/mips/kernel/mips-r2-to-r6-emul.c |  7 +--
 arch/mips/kernel/proc.c               | 95 ++++++++++++++++++++---------------
 2 files changed, 59 insertions(+), 43 deletions(-)

-- 
2.10.1

