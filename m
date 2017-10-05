From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Oct 2017 19:34:32 +0000
Subject: [PATCH 0/2] PowerPC-Cell platform: Adjustments for four function implementations
Message-Id: <db9efaf4-f3d7-d5dc-b0b2-f20e418fa3c8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Oct 2017 21:25:43 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in three functions
  Improve a size determination in three functions

 arch/powerpc/platforms/cell/axon_msi.c          |  7 ++-----
 arch/powerpc/platforms/cell/spider-pci.c        | 11 +++--------
 arch/powerpc/platforms/cell/spufs/lscsa_alloc.c |  2 +-
 3 files changed, 6 insertions(+), 14 deletions(-)

-- 
2.14.2

