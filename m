From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 20:50:23 +0000
Subject: [PATCH 0/5] MIPS-kernel: Adjustments for some function implementations
Message-Id: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Ingo Molnar <mingo@kernel.org>, James Hogan <james.hogan@imgtec.com>, Kees Cook <keescook@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 22:40:04 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Delete an error message for a failed memory allocation in cps_pm_online_cpu()
  Delete error messages for failed memory allocations in cps_prepare_cpus()
  Delete an error message for a failed memory allocation in vpe_open()
  Improve a size determination in two functions
  Adjust 13 checks for null pointers

 arch/mips/kernel/pm-cps.c  |  5 ++---
 arch/mips/kernel/smp-cps.c |  9 ++-------
 arch/mips/kernel/vpe.c     | 37 +++++++++++++++++--------------------
 3 files changed, 21 insertions(+), 30 deletions(-)

-- 
2.13.0

