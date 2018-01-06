From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 Jan 2018 15:06:37 +0000
Subject: [PATCH 0/5] mtd/rfd_ftl: Adjustments for some function implementations
Message-Id: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 16:00:01 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Delete an error message for a failed memory allocation in scan_header()
  Less function calls in scan_header() after error detection
  Improve a size determination in two functions
  Return directly after a failed kmalloc() in erase_block()
  Add some spaces for better code readability

 drivers/mtd/rfd_ftl.c | 45 +++++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

-- 
2.15.1

