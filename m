From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Oct 2016 20:22:07 +0000
Subject: [PATCH 0/2] M32R-setup: Fine-tuning for show_cpuinfo()
Message-Id: <fef662e1-b5b4-127e-9427-a98ffb512a82@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Toshi Kani <toshi.kani@hpe.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Oct 2016 22:15:22 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use seq_putc()
  Replace 16 seq_printf() calls by seq_puts()

 arch/m32r/kernel/setup.c | 54 ++++++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

-- 
2.10.1

