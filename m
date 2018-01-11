From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Jan 2018 17:58:21 +0000
Subject: [PATCH 0/5] powerpc/platforms/4xx: Adjustments for six function implementations
Message-Id: <2b9b4285-f1c0-5dc7-35c6-df901c9ca0eb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Jan 2018 18:48:28 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Combine four seq_printf() calls into two in ocm_debugfs_show()
  Use seq_putc() in ocm_debugfs_show()
  Delete an error message for a failed memory allocation in three functions
  Improve a size determination in two functions
  Delete an unnecessary return statement in two functions

 arch/powerpc/platforms/4xx/msi.c |  7 +++----
 arch/powerpc/platforms/4xx/ocm.c | 19 +++++--------------
 arch/powerpc/platforms/4xx/pci.c |  1 -
 3 files changed, 8 insertions(+), 19 deletions(-)

-- 
2.15.1

