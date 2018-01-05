From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 Jan 2018 20:27:36 +0000
Subject: [PATCH 0/3] mtd/nand/ams-delta: Adjustments for three function implementations
Message-Id: <8f678424-3ce1-3a4c-1b0d-f3ac9a226f00@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jan 2018 21:21:12 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in ams_delta_init()
  Improve a size determination in ams_delta_init()
  Add some spaces for better code readability

 drivers/mtd/nand/ams-delta.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.15.1

