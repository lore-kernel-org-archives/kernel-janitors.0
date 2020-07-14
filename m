From: David Miller <davem@davemloft.net>
Date: Tue, 14 Jul 2020 21:09:23 +0000
Subject: Re: [PATCH] net: neterion: s2io: switch from 'pci_' to 'dma_' API
Message-Id: <20200714.140923.990048112728878373.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714090620.298884-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200714090620.298884-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: jdmason@kudzu.us, ast@kernel.org, kuba@kernel.org, daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 14 Jul 2020 11:06:20 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GPF_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'init_shared_mem()' GFP_KERNEL can be used
> because this flag is already used to allocate some memory in this function.
> 
> While at it, update some debug message to match the new function names.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
