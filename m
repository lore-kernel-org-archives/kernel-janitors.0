From: David Miller <davem@davemloft.net>
Date: Tue, 31 Jul 2007 21:07:28 +0000
Subject: Re: [PATCH 39] net/ipv4/ip_options.c: kmalloc + memset conversion
Message-Id: <20070731.140728.118970012.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
	<200707312016.59970.m.kozlowski@tuxland.pl>
In-Reply-To: <200707312016.59970.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: m.kozlowski@tuxland.pl
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, netdev@vger.kernel.org

From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 20:16:59 +0200

> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

Applied, but note that this patch changes behavior, previously
only the ip_options structure base was cleared out, but now
the whole memory region is cleared.

I think it's OK for this case, but I'm just making note of it.
