From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Oct 2017 20:50:29 +0000
Subject: [PATCH 0/2] Power Mac: Adjustments for five function implementations
Message-Id: <5188c0b3-476a-6a14-bab5-052ad0f4dae0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Oct 2017 22:48:22 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in kw_i2c_host_init()
  Improve a size determination in five functions

 arch/powerpc/platforms/powermac/low_i2c.c    | 11 ++++-------
 arch/powerpc/platforms/powermac/pfunc_core.c |  4 ++--
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.14.2

