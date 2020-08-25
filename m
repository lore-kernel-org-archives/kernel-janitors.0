From: David Miller <davem@davemloft.net>
Date: Tue, 25 Aug 2020 00:33:33 +0000
Subject: Re: [PATCH] typhoon: switch from 'pci_' to 'dma_' API
Message-Id: <20200824.173333.548043755025064224.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200823061150.162135-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200823061150.162135-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: dave@thedillows.org, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 23 Aug 2020 08:11:50 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'typhoon_init_one()' GFP_KERNEL can be used
> because it is a probe function and no lock is acquired.
> 
> When memory is allocated in 'typhoon_download_firmware()', GFP_ATOMIC
> must be used because it can be called from a .ndo_tx_timeout function.
> So this function can be called with the 'netif_tx_lock' acquired.
> The call chain is:
>   --> typhoon_tx_timeout                 (.ndo_tx_timeout function)
>     --> typhoon_start_runtime
>       --> typhoon_download_firmware
> 
> While at is, update some comments accordingly.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
