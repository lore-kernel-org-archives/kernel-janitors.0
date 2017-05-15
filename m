From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 12:25:13 +0000
Subject: [PATCH 0/4] PCMCIA-PD6729: Adjustments for four function implementations
Message-Id: <07cd817c-3045-72d8-34e2-e81b73efc291@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 14:05:06 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use kcalloc() in pd6729_pci_probe()
  Delete an error message for a failed memory allocation in pd6729_pci_probe()
  Add the macro "pr_fmt"
  Combine substrings for six messages

 drivers/pcmcia/pd6729.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

-- 
2.13.0

