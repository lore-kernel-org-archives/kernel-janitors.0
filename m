From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 17:12:46 +0000
Subject: [PATCH 0/4] S390: Fine-tuning for six function implementations
Message-Id: <fac68081-f0bb-2574-ba52-11ad78d792c3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-s390@vger.kernel.org, =?UTF-8?Q?Christian_Borntr=c3=a4ger?= <borntraeger@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Ingo Molnar <mingo@kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Sascha Silbe <silbe@linux.vnet.ibm.com>, Vegard Nossum <vegard.nossum@oracle.com>, Viktor Mihajlovski <mihajlov@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 19:00:09 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Combine two function calls into one in show_cacheinfo()
  Use seq_putc() in show_cpu_summary()
  Replace six seq_printf() calls by seq_puts()
  Combine two function calls into one at four places

 arch/s390/kernel/cache.c     |  4 ++--
 arch/s390/kernel/processor.c |  2 +-
 arch/s390/kernel/sysinfo.c   | 25 +++++++++++--------------
 3 files changed, 14 insertions(+), 17 deletions(-)

-- 
2.12.2

