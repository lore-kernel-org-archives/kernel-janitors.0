From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 Jan 2018 19:28:52 +0000
Subject: [PATCH 0/2] mtdconcat: Adjustments for two function implementations
Message-Id: <07947bdd-2b30-e4b5-82f7-d98b62df858e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jan 2018 20:24:56 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in mtd_concat_create()
  Improve a size determination in concat_erase()

 drivers/mtd/mtdconcat.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.15.1

