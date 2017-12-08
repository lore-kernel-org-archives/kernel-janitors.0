From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 08 Dec 2017 21:11:03 +0000
Subject: [PATCH 0/2] mtd: onenand: samsung: Simplify code and fix leaks in error handling paths
Message-Id: <cover.1512765898.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kyungmin.park@samsung.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The first patch converts 's3c_onenand_probe()' to devm_ functions.
This fixes a leak in one path (line 872).
This also free_irq which was not handled at all. (I hope I'm correct :) )

The 2nd patch is about an un-handled error code which looks spurious.
Not sure if I'm right.


While compile-testing it, I had to tweak the code because I don't have any
cross-compiler.
I commented the line "#include <asm/mach/flash.h>" and the compilation
succeeded. So maybe, this include is also useless.
I've left it as-is, though.


Theses patches have been compile-tested-only.


Christophe JAILLET (2):
  mtd: onenand: samsung: use devm_ function to simplify code and fix
    some leaks
  mtd: onenand: samsung: return an error if
    'mtd_device_parse_register()' fails

 drivers/mtd/onenand/samsung.c | 145 ++++++++++++++----------------------------
 1 file changed, 47 insertions(+), 98 deletions(-)

-- 
2.14.1

