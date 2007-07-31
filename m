From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 22:07:02 +0000
Subject: [PATCH 73] drivers/parport/share.c: kmalloc + memset conversion to kzalloc
Message-Id: <200708010007.03181.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/parport/share.c | 29584 -> 29542 (-42 bytes)
 drivers/parport/share.o | 117775 -> 117795 (+20 bytes)

 drivers/parport/share.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/parport/share.c	2007-07-26 13:07:44.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/parport/share.c	2007-07-30 00:14:05.000000000 +0200
@@ -282,14 +282,13 @@ struct parport *parport_register_port(un
 	int device;
 	char *name;

-	tmp = kmalloc(sizeof(struct parport), GFP_KERNEL);
+	tmp = kzalloc(sizeof(struct parport), GFP_KERNEL);
 	if (!tmp) {
 		printk(KERN_WARNING "parport: memory squeeze\n");
 		return NULL;
 	}

 	/* Init our structure */
- 	memset(tmp, 0, sizeof(struct parport));
 	tmp->base = base;
 	tmp->irq = irq;
 	tmp->dma = dma;
