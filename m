From: David Miller <davem@davemloft.net>
Date: Sun, 12 Jul 2020 22:26:20 +0000
Subject: Re: [PATCH] net: sky2: switch from 'pci_' to 'dma_' API
Message-Id: <20200712.152620.1377283252235621441.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711204944.259152-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200711204944.259152-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: mlindner@marvell.com, stephen@networkplumber.org, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Jul 2020 22:49:44 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GPF_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'sky2_alloc_buffers()', GFP_KERNEL can be used
> because some other memory allocations in the same function already use this
> flag.
> 
> When memory is allocated in 'sky2_probe()', GFP_KERNEL can be used
> because another memory allocations in the same function already uses this
> flag.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
