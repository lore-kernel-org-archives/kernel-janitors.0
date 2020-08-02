From: Kalle Valo <kvalo@codeaurora.org>
Date: Sun, 02 Aug 2020 15:19:25 +0000
Subject: Re: [PATCH 1/2] ipw2100: Use GFP_KERNEL instead of GFP_ATOMIC in some memory allocation
Message-Id: <20200802151925.81F7EC433C9@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200722101701.26126-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200722101701.26126-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: stas.yakovlev@gmail.com, davem@davemloft.net, kuba@kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> The call chain is:
>    ipw2100_pci_init_one            (the probe function)
>      --> ipw2100_queues_allocate
>        --> ipw2100_tx_allocate
> 
> No lock is taken in the between.
> So it is safe to use GFP_KERNEL in 'ipw2100_tx_allocate()'.
> 
> BTW, 'ipw2100_queues_allocate()' also calls 'ipw2100_msg_allocate()' which
> already allocates some memory using GFP_KERNEL.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

2 patches applied to wireless-drivers-next.git, thanks.

9130559cf8db ipw2100: Use GFP_KERNEL instead of GFP_ATOMIC in some memory allocation
e52525c0c320 ipw2x00: switch from 'pci_' to 'dma_' API

-- 
https://patchwork.kernel.org/patch/11678101/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
