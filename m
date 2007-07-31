From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 18:03:14 +0000
Subject: PATCH 32] drivers/mtd/inftlmount.c: kmalloc + memset conversion to kcalloc
Message-Id: <200707312003.15009.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: dwmw2@infradead.org, Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/mtd/inftlmount.c | 23841 -> 23803 (-38 bytes)
 drivers/mtd/inftlmount.o | 47196 -> 46956 (-240 bytes)

 drivers/mtd/inftlmount.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/mtd/inftlmount.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/mtd/inftlmount.c	2007-07-31 11:40:20.000000000 +0200
@@ -580,14 +580,13 @@ int INFTL_mount(struct INFTLrecord *s)
 	logical_block = block = BLOCK_NIL;

 	/* Temporary buffer to store ANAC numbers. */
-	ANACtable = kmalloc(s->nb_blocks * sizeof(u8), GFP_KERNEL);
+	ANACtable = kcalloc(s->nb_blocks, sizeof(u8), GFP_KERNEL);
 	if (!ANACtable) {
 		printk(KERN_WARNING "INFTL: allocation of ANACtable "
 				"failed (%zd bytes)\n",
 				s->nb_blocks * sizeof(u8));
 		return -ENOMEM;
 	}
-	memset(ANACtable, 0, s->nb_blocks);

 	/*
 	 * First pass is to explore each physical unit, and construct the
