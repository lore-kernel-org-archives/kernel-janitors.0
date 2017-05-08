From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 15:07:02 +0000
Subject: [PATCH 0/3] mtdswap: Fine-tuning for three function implementations
Message-Id: <82e905b5-3958-be81-b0ee-d0a2805154df@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 17:02:03 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Reduce function calls for sequence output in mtdswap_show()
  Improve two size determinations in mtdswap_add_mtd()
  Improve a size determination in mtdswap_erase_block()

 drivers/mtd/mtdswap.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

-- 
2.12.2

