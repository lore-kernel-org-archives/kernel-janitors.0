From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 27 Aug 2020 09:59:08 +0000
Subject: Re: [PATCH] mwifiex: Clean up some err and dbg messages
Message-Id: <20200827095908.630E9C433A1@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200819071853.113185-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200819071853.113185-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: amitkarwar@gmail.com, ganapathi.bhat@nxp.com, huxinming820@gmail.com, davem@davemloft.net, kuba@kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> The error message if 'pci_set_consistent_dma_mask()' fails is misleading.
> The function call uses 32 bits, but the error message reports 64.
> 
> Moreover, according to the comment above 'dma_set_mask_and_coherent()'
> definition, such an error can never happen.
> 
> So, simplify code, axe the misleading message and use
> 'dma_set_mask_and_coherent()' instead of 'dma_set_mask()' +
> 'dma_set_coherent_mask()'
> 
> While at it, make some clean-up:
>    - add # when reporting allocated length to be consistent between
>      functions
>    - s/consistent/coherent/
>    - s/unsigned int/u32/ to be consistent between functions
>    - align some code
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied to wireless-drivers-next.git, thanks.

5f8a3ed38bec mwifiex: Clean up some err and dbg messages

-- 
https://patchwork.kernel.org/patch/11723131/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
