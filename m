From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Dec 2016 16:57:53 +0000
Subject: [PATCH 0/2] ARM: mmp: Fine-tuning for sram_probe()
Message-Id: <b687577b-e664-6aa1-a85c-438e96216171@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Dec 2016 17:50:23 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Check return values from ioremap() and kstrdup()
  Delete an unnecessary variable initialisation

 arch/arm/mach-mmp/sram.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
2.11.0

