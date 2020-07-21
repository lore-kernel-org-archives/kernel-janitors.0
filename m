From: David Miller <davem@davemloft.net>
Date: Tue, 21 Jul 2020 01:32:33 +0000
Subject: Re: [PATCH] mISDN: switch from 'pci_' to 'dma_' API
Message-Id: <20200720.183233.1523852489153157390.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200718103033.352247-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200718103033.352247-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: isdn@linux-pingi.de, sergey.senozhatsky@gmail.com, wangkefeng.wang@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 18 Jul 2020 12:30:33 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'setup_hw()' (hfcpci.c) GFP_KERNEL can be used
> because it is called from the probe function and no lock is taken.
> The call chain is:
>    hfc_probe()
>    --> setup_card()
>    --> setup_hw()
> 
> When memory is allocated in 'inittiger()' (netjet.c) GFP_ATOMIC must be
> used because a spin_lock is taken by the caller (i.e. 'nj_init_card()')
> This is also consistent with the other allocations done in the function.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.
