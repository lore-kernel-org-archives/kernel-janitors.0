From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 04 Jun 2017 21:04:16 +0000
Subject: [PATCH 0/3] ARM-XEN: Adjustments for __set_phys_to_machine_multi()
Message-Id: <9b9230f4-0f00-e019-75b4-571e29b52998@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 4 Jun 2017 22:45:54 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Improve a size determination
  Delete an error message for a failed memory allocation
  Adjust one function call together with a variable assignment

 arch/arm/xen/p2m.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.13.0

