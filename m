From: Mathieu Malaterre <malat@debian.org>
Date: Tue, 04 Dec 2018 20:10:57 +0000
Subject: [PATCH v2] mtd: rawnand: jz4780: annotate implicit fall throughs
Message-Id: <20181204201057.30733-1-malat@debian.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203212214.8862-1-malat@debian.org>
In-Reply-To: <20181203212214.8862-1-malat@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Burton <paul.burton@mips.com>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

There is a plan to build the kernel with -Wimplicit-fallthrough and
these places in the code produced warnings. Fix them up.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
v2: fix subject prefix non sense

 drivers/mtd/nand/raw/jz4780_bch.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/jz4780_bch.c
index 731c6051d91e..7201827809e9 100644
--- a/drivers/mtd/nand/raw/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/jz4780_bch.c
@@ -136,8 +136,10 @@ static void jz4780_bch_read_parity(struct jz4780_bch *bch, void *buf,
 	switch (size8) {
 	case 3:
 		dest8[2] = (val >> 16) & 0xff;
+		/* fall through */
 	case 2:
 		dest8[1] = (val >> 8) & 0xff;
+		/* fall through */
 	case 1:
 		dest8[0] = val & 0xff;
 		break;
-- 
2.19.2
