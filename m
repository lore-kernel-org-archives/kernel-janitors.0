From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 20:24:54 +0000
Subject: [PATCH 0/2] FireWire-OHCI: Fine-tuning for some function implementations
Message-Id: <1139a329-f084-c4f3-d9af-19ad15445017@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 22:22:10 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use kcalloc() in pci_probe()
  Adjust 15 checks for null pointers

 drivers/firewire/ohci.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

-- 
2.12.2

