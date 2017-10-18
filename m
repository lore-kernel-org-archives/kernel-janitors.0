From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Oct 2017 19:20:16 +0000
Subject: [PATCH 0/5] PowerPC-pSeries: Adjustments for seven function implementations
Message-Id: <0d221be4-1402-0499-d95e-afa4a30e1f33@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Andrew Morton <akpm@linux-foundation.org>, Bart Van Assche <bart.vanassche@sandisk.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Gibson <david@gibson.dropbear.id.au>, Doug Ledford <dledford@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Sahil Mehta <sahilmehta17@gmail.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Oct 2017 21:11:23 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Delete five error messages for a failed memory allocation
  Improve nine size determinations
  Delete an unnecessary variable initialisation in iommu_pseries_alloc_group()
  Return directly after a failed kzalloc_node() in iommu_pseries_alloc_group()
  Less function calls in iommu_pseries_alloc_group() after error detection

 arch/powerpc/platforms/pseries/dlpar.c     |  5 ++--
 arch/powerpc/platforms/pseries/dtl.c       |  5 +---
 arch/powerpc/platforms/pseries/hvcserver.c |  7 ++----
 arch/powerpc/platforms/pseries/iommu.c     | 40 ++++++++++++------------------
 arch/powerpc/platforms/pseries/vio.c       |  9 +++----
 5 files changed, 24 insertions(+), 42 deletions(-)

-- 
2.14.2

