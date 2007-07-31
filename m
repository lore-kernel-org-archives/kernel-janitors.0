From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 21:29:15 +0000
Subject: [PATCH 56] drivers/scsi/NCR_D700.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312329.15766.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-scsi@vger.kernel.org, James.Bottomley@steeleye.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/scsi/NCR_D700.c | 10643 -> 10615 (-28 bytes)
 drivers/scsi/NCR_D700.o | 118400 -> 118196 (-204 bytes)

 drivers/scsi/NCR_D700.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/scsi/NCR_D700.c	2007-07-26 13:07:42.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/scsi/NCR_D700.c	2007-07-31 11:13:37.000000000 +0200
@@ -313,10 +313,10 @@ NCR_D700_probe(struct device *dev)
 		break;
 	}

-	p = kmalloc(sizeof(*p), GFP_KERNEL);
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
-	memset(p, '\0', sizeof(*p));
+
 	p->dev = dev;
 	snprintf(p->name, sizeof(p->name), "D700(%s)", dev->bus_id);
 	if (request_irq(irq, NCR_D700_intr, IRQF_SHARED, p->name, p)) {
