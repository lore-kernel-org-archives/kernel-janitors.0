From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Sep 2020 14:15:01 +0000
Subject: Re: [PATCH] tlan: switch from 'pci_' to 'dma_' API
Message-Id: <840e5434-1bbf-51c5-e1ba-6a26e0b4e49c@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200912102519.337303-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200912102519.337303-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: davem@davemloft.net, kuba@kernel.org, andy@greyhouse.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 12/09/2020 à 12:25, Christophe JAILLET a écrit :
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
>    tlan_probe                        (module_init function)
>      --> tlan_eisa_probe
> or
>    tlan_init_one                     (probe function)
> 
> then in both cases:
>      --> tlan_probe1
>        --> tlan_init
> 
> [...]
> ---
>   drivers/net/ethernet/ti/tlan.c | 61 ++++++++++++++++------------------
>   1 file changed, 28 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/tlan.c b/drivers/net/ethernet/ti/tlan.c
> index 76a342ea3797..1203a3c0febb 100644
> --- a/drivers/net/ethernet/ti/tlan.c
> +++ b/drivers/net/ethernet/ti/tlan.c
> [...]

This patch has been sent twice.
This one is the 2nd copy with the wrong person in To:.

Apologizes for the noise.

CJ
