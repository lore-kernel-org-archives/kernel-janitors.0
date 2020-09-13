From: David Miller <davem@davemloft.net>
Date: Sun, 13 Sep 2020 01:26:50 +0000
Subject: Re: [PATCH] tlan: switch from 'pci_' to 'dma_' API
Message-Id: <20200912.182650.260627332372424414.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200912074359.334234-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200912074359.334234-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, chessman@tux.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Sep 2020 09:43:58 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'tlan_init()' GFP_KERNEL can be used because
> it is only called from a probe function or a module_init function and no
> lock is taken in the between.
> The call chain is:
>   tlan_probe                        (module_init function)
>     --> tlan_eisa_probe
> or
>   tlan_init_one                     (probe function)
> 
> then in both cases:
>     --> tlan_probe1
>       --> tlan_init
> 
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
