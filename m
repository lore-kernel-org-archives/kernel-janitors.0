From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 14 Dec 2017 06:03:48 +0000
Subject: [PATCH 0/4 v3] mtd: onenand: samsung: Simplify code and fix leaks in error handling paths
Message-Id: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kyungmin.park@samsung.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The first patch converts 's3c_onenand_probe()' to devm_ functions.
This fixes a leak in one path (line 872).
This also free_irq which was not handled at all. ( I hope I'm correct :) )

The 2nd patch is about an un-handled error code which looks spurious.
Not sure if I'm right.

The 3rd patch propagates an error code instead of returning a hard-coded
value.

The last one removes a useless include spotted while compile-testing.


v3: patch 1/4 updated to fix a bug introduced in v2
    patch 2/4 unchanged
    patch 3/4 and 4/4 added
    now the patch are cross-compile tested :)

Theses patches have been cross compile-tested-only.

Christophe JAILLET (4):
  mtd: onenand: samsung: use devm_ function to simplify
    code and fix some leaks
  mtd: onenand: samsung: return an error if 
    'mtd_device_parse_register()' fails
  mtd: onenand: samsung: Propagate the error returned
    by 'onenand_scan()'
  mtd: onenand: samsung: Remove a useless include

 drivers/mtd/onenand/samsung.c | 172 +++++++++---------------------------------
 1 file changed, 35 insertions(+), 137 deletions(-)

-- 
2.14.1

