From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Oct 2017 15:40:05 +0000
Subject: [PATCH 0/2] PowerPC-Cell OProfile: Adjustments for three function implementations
Message-Id: <596db1f4-5965-d6f8-af02-38b570b10d8a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, oprofile-list@lists.sf.net, Al Viro <viro@zeniv.linux.org.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Robert Richter <rric@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Oct 2017 17:32:10 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in three functions
  Improve a size determination in two functions

 arch/powerpc/oprofile/cell/spu_task_sync.c | 10 +---------
 arch/powerpc/oprofile/cell/vma_map.c       |  6 ++----
 2 files changed, 3 insertions(+), 13 deletions(-)

-- 
2.14.2

