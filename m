From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 07:55:32 +0000
Subject: [PATCH 0/3] block-AoE: Fine-tuning for six function implementations
Message-Id: <705a2cf5-90fe-ec8a-95f9-a27bccbc3f3f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, "Ed L. Cashin" <ed.cashin@acm.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 09:50:05 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use seq_putc() in aoedisk_debugfs_show()
  Adjust eight checks for null pointers
  Add spaces for better code readability

 drivers/block/aoe/aoeblk.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

-- 
2.12.2

