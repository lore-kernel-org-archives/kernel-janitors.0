From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Jun 2015 16:18:48 +0000
Subject: [PATCH 0/2] vfio: powerpc/spapr: Deletion of an unnecessary check
Message-Id: <55901E68.80205@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.so
 urceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>, Julia Lawall <julia.lawall@lip6.fr>, Michael Ellerman <mpe@ellerman.id.au>

From: Markus Elfring <elfring@users.sourceforge.net>

Another update suggestion was taken into account after a patch was applied
from static source code analysis.

Markus Elfring (2):
  Delete an unnecessary check before the function call "kfree"
  One function call less in tce_iommu_attach_group() after kzalloc() failure

 drivers/vfio/vfio_iommu_spapr_tce.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.4.4

