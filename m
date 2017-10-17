From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 18:54:12 +0000
Subject: [PATCH 0/2] PowerPC-PS3: Adjustments for three function implementations
Message-Id: <36a8ba41-7f1e-31f8-5d32-19e04393b181@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 20:22:44 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in update_flash_db()
  Improve a size determination in two functions

 arch/powerpc/platforms/ps3/mm.c      | 6 ++----
 arch/powerpc/platforms/ps3/os-area.c | 4 +---
 2 files changed, 3 insertions(+), 7 deletions(-)

-- 
2.14.2

