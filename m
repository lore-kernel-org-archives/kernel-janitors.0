From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 28 Mar 2011 12:25:52 +0000
Subject: Re: [PATCH 2/2 v2] tg3: Don't use IRQF_SAMPLE_RANDOM
Message-Id: <1301315152.3182.19.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301314543-3666-1-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1301314543-3666-1-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Javier Martinez Canillas <martinez.javier@gmail.com>
Cc: David Miller <davem@davemloft.net>, Dan Carpenter <error27@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Le lundi 28 mars 2011 à 14:15 +0200, Javier Martinez Canillas a écrit :
> This flag is scheduled for removal so we shouldn't used it.
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> ---
> v2: Initialize flags to zero suggested by Dan Carpenter.
> 
>  drivers/net/tg3.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

1) We dont believe its Janitor material ;)

http://thread.gmane.org/gmane.linux.kernel/680723

http://kerneltrap.org/mailarchive/linux-netdev/2009/4/6/5417754

2) If removal is accepted, we should patch all drivers at once

drivers/net/xen-netfront.c:1419:					IRQF_SAMPLE_RANDOM, netdev->name,
drivers/net/cris/eth_v10.c:495:			IRQF_SAMPLE_RANDOM, cardname, (void *)dev)) {
drivers/net/ibmlana.c:785:	result = request_irq(priv->realirq, irq_handler, IRQF_SHARED | IRQF_SAMPLE_RANDOM, dev->name, dev);
drivers/net/qla3xxx.c:3471:	unsigned long irq_flags = IRQF_SAMPLE_RANDOM | IRQF_SHARED;
drivers/net/netxen/netxen_nic_main.c:908:	unsigned long flags = IRQF_SAMPLE_RANDOM;
drivers/net/atlx/atl1.c:2575:	int irq_flags = IRQF_SAMPLE_RANDOM;
drivers/net/macb.c:1174:	err = request_irq(dev->irq, macb_interrupt, IRQF_SAMPLE_RANDOM,
drivers/net/bcm63xx_enet.c:843:			  IRQF_SAMPLE_RANDOM | IRQF_DISABLED, dev->name, dev);
drivers/net/niu.c:6075:				  IRQF_SHARED | IRQF_SAMPLE_RANDOM,
drivers/net/tg3.c:8842:		flags = IRQF_SAMPLE_RANDOM;


