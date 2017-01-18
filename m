From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 18:52:54 +0000
Subject: [PATCH 0/3] MIPS: Fine-tuning for three function implementations
Message-Id: <bb402413-83e5-9b34-304c-9f4bca6037d9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 19:43:34 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Return directly in 32_mmap2()
  Move an assignment for the variable "retval" in mipsmt_sys_sched_setaffinity()
  Return directly in mips_mmap()

 arch/mips/kernel/linux32.c       | 11 +++--------
 arch/mips/kernel/mips-mt-fpaff.c |  5 +++--
 arch/mips/kernel/syscall.c       | 11 ++---------
 3 files changed, 8 insertions(+), 19 deletions(-)

-- 
2.11.0

