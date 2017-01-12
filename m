From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 10:33:19 +0000
Subject: [PATCH 0/3] MTD-FTL: Fine-tuning for two function implementations
Message-Id: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 11:24:12 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use kmalloc_array() in build_maps()
  Delete an error message for a failed memory allocation in ftl_add_mtd()
  Improve another size determination in ftl_add_mtd()

 drivers/mtd/ftl.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

-- 
2.11.0

