From: Vinod Koul <vkoul@kernel.org>
Date: Thu, 10 Dec 2020 09:33:29 +0000
Subject: Re: [PATCH] dmaengine: =?utf-8?Q?sf-pdma?= =?utf-8?Q?=3A_Reduce_scope_for_the_variable_=E2=80=9Cvd?=
Message-Id: <20201210092129.GO8403@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cd695d1-c081-1d95-de7b-9747e9a76de2@web.de>
In-Reply-To: <8cd695d1-c081-1d95-de7b-9747e9a76de2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Green Wan <green.wan@sifive.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 09-12-20, 21:00, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 9 Dec 2020 20:55:05 +0100
> 
> A local variable was used only within an else branch.
> Thus move the definition for the variable “vd” into the corresponding
> code block.
> 
> This issue was detected by using the Coccinelle software.

And what was the issue detected...?

I feel this is fine and patch below does not add much value..

> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index c4c4e8575764..c66da79a1b34 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -164,7 +164,6 @@ static void sf_pdma_free_chan_resources(struct dma_chan *dchan)
>  static size_t sf_pdma_desc_residue(struct sf_pdma_chan *chan,
>  				   dma_cookie_t cookie)
>  {
> -	struct virt_dma_desc *vd = NULL;
>  	struct pdma_regs *regs = &chan->regs;
>  	unsigned long flags;
>  	u64 residue = 0;
> @@ -180,7 +179,7 @@ static size_t sf_pdma_desc_residue(struct sf_pdma_chan *chan,
>  	if (cookie = tx->cookie) {
>  		residue = readq(regs->residue);
>  	} else {
> -		vd = vchan_find_desc(&chan->vchan, cookie);
> +		struct virt_dma_desc *vd = vchan_find_desc(&chan->vchan, cookie);
>  		if (!vd)
>  			goto out;
> 
> --
> 2.29.2

-- 
~Vinod
