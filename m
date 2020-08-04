From: David Miller <davem@davemloft.net>
Date: Tue, 04 Aug 2020 23:17:52 +0000
Subject: Re: [PATCH] wan: wanxl: switch from 'pci_' to 'dma_' API
Message-Id: <20200804.161752.751928646102837799.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200804200809.714999-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200804200809.714999-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: khc@pm.waw.pl, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue,  4 Aug 2020 22:08:09 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'wanxl_pci_init_one()', GFP_KERNEL can be used
> because it is a probe function and no lock is acquired.
> Moreover, just a few lines above, GFP_KERNEL is already used.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
