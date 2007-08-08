From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Wed, 08 Aug 2007 06:02:24 +0000
Subject: Re: [PATCH 55] drivers/char/n_hdlc.c: kmalloc + memset conversion to kzalloc
Message-Id: <200708080802.24635.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl> <200707312327.30692.m.kozlowski@tuxland.pl> <20070801011655.08e3c17b@the-village.bc.nu>
In-Reply-To: <20070801011655.08e3c17b@the-village.bc.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, khc@pm.waw.pl

> > Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
> NAK
> 
> > -	struct n_hdlc *n_hdlc = kmalloc(sizeof(*n_hdlc), GFP_KERNEL);
> > -
> > +	struct n_hdlc *n_hdlc;
> > +
> > +	n_hdlc = kzalloc(sizeof(*n_hdlc), GFP_KERNEL);
> 
> Change looks fine but please keep the original formatting style

Ok. Here it goes (based on 2.6.23-rc1-mm2).

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/char/n_hdlc.c | 27451 -> 27413 (-38 bytes)
 drivers/char/n_hdlc.o | 107068 -> 107088 (+20 bytes)

 drivers/char/n_hdlc.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm2-a/drivers/char/n_hdlc.c	2007-08-01 08:43:44.000000000 +0200
+++ linux-2.6.23-rc1-mm2-b/drivers/char/n_hdlc.c	2007-08-08 07:50:42.000000000 +0200
@@ -807,13 +807,11 @@ static struct n_hdlc *n_hdlc_alloc(void)
 {
 	struct n_hdlc_buf *buf;
 	int i;
-	struct n_hdlc *n_hdlc = kmalloc(sizeof(*n_hdlc), GFP_KERNEL);
+	struct n_hdlc *n_hdlc = kzalloc(sizeof(*n_hdlc), GFP_KERNEL);

 	if (!n_hdlc)
 		return NULL;

-	memset(n_hdlc, 0, sizeof(*n_hdlc));
-
 	n_hdlc_buf_list_init(&n_hdlc->rx_free_buf_list);
 	n_hdlc_buf_list_init(&n_hdlc->tx_free_buf_list);
 	n_hdlc_buf_list_init(&n_hdlc->rx_buf_list);
