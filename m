From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Dec 2017 13:50:07 +0000
Subject: [PATCH 0/2] PS3: Adjustments for six function implementations
Message-Id: <9b6464bc-a408-de2a-1b54-cb7794b92506@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Dec 2017 14:42:24 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in five functions

 drivers/ps3/ps3-lpm.c         |  2 --
 drivers/ps3/ps3-sys-manager.c |  9 ++-------
 drivers/ps3/ps3-vuart.c       | 12 +++---------
 3 files changed, 5 insertions(+), 18 deletions(-)

-- 
2.15.1

