From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 Jan 2018 12:44:31 +0000
Subject: [PATCH 0/3] mtd/nftlmount: Adjustments for seven function implementations
Message-Id: <57d4cbcf-c99c-f3d5-e2bf-f67873f321ea@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 13:38:32 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete two error messages for a failed memory allocation in find_boot_record()
  Delete eight unwanted spaces behind function names
  Add some spaces for better code readability

 drivers/mtd/nftlmount.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

-- 
2.15.1

