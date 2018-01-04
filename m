From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 Jan 2018 10:50:14 +0000
Subject: [PATCH 0/2] mtd/maps/sun_uflash: Adjustments for uflash_devinit()
Message-Id: <30c07f5a-578c-0e53-b80f-675fb24e6223@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jan 2018 11:45:54 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/mtd/maps/sun_uflash.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.15.1

