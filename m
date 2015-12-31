From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 31 Dec 2015 20:21:14 +0000
Subject: [PATCH 0/3] mtd-rfd_ftl: Fine-tuning for two function implementations
Message-Id: <56858E3A.7000706@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 31 Dec 2015 21:15:15 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Replace a variable initialisation by assignments
  Refactoring for move_block_contents()
  Refactoring for erase_block()

 drivers/mtd/rfd_ftl.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

-- 
2.6.3

