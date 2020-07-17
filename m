From: David Miller <davem@davemloft.net>
Date: Fri, 17 Jul 2020 19:53:14 +0000
Subject: Re: [PATCH] net: sun: cassini: switch from 'pci_' to 'dma_' API
Message-Id: <20200717.125314.601518083747025983.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200716190358.318180-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200716190358.318180-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, hkallweit1@gmail.com, jgg@ziepe.ca, chao@kernel.org, wu000273@umn.edu, weiyongjun1@huawei.com, yuehaibing@huawei.com, vaibhavgupta40@gmail.com, jonathan.lemon@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 16 Jul 2020 21:03:58 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'cas_tx_tiny_alloc()', GFP_KERNEL can be used
> because a few lines below in its only caller, 'cas_alloc_rxds()', is also
> called. This function makes an explicit use of GFP_KERNEL.
> 
> When memory is allocated in 'cas_init_one()', GFP_KERNEL can be used
> because it is a probe function and no lock is acquired.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.
