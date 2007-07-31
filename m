From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 21:17:55 +0000
Subject: Re: [PATCH 41] drivers/net/irda/irda-usb.c: mostly kmalloc + memset conversion to k[cz]alloc
Message-Id: <200707312317.55885.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl> <200707312020.37331.m.kozlowski@tuxland.pl> <20070731.140925.25232050.davem@davemloft.net>
In-Reply-To: <20070731.140925.25232050.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, samuel@sortiz.org, nick@fedchik.org.ua

> > Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
> Like the ATM patch, this one doesn't apply cleanly.

Ok I'll give another k[czm]alloc run right after -mm2 shows up.

Thanks,

	Mariusz
