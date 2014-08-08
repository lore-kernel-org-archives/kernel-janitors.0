From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 08 Aug 2014 09:30:48 +0000
Subject: Re: [PATCH] block: add abort on failure
Message-Id: <alpine.DEB.2.10.1408081129150.2348@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407486050-9375-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407486050-9375-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joshua Morris <josh.h.morris@us.ibm.com>
Cc: Jeff Moyer <jmoyer@redhat.com>, kernel-janitors@vger.kernel.org, Philip Kelleher <pjk1939@linux.vnet.ibm.com>, dan.carpenter@oracle.com, linux-kernel@vger.kernel.org

On Fri, 8 Aug 2014, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Initializing card seems to be critical to the rest of the probe process, so
> abort the probe function if the calls to rsxx_load_config and
> rsxx_get_num_targets do not succeed.

Note that this is not tested.  Nevertheless, at least the first failure
will leave card in an unknown partially initialized state, which seems
undesirable.

julia


> Suggested by Jeff Moyer.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  drivers/block/rsxx/core.c |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
> index a8de2ee..ae2805b 100644
> --- a/drivers/block/rsxx/core.c
> +++ b/drivers/block/rsxx/core.c
> @@ -915,15 +915,19 @@ static int rsxx_pci_probe(struct pci_dev *dev,
>
>  	/************* Load Card Config *************/
>  	st = rsxx_load_config(card);
> -	if (st)
> +	if (st) {
>  		dev_err(CARD_TO_DEV(card),
>  			"Failed loading card config\n");
> +		goto failed_dma_setup;
> +	}
>
>  	/************* Setup DMA Engine *************/
>  	st = rsxx_get_num_targets(card, &card->n_targets);
> -	if (st)
> +	if (st) {
>  		dev_info(CARD_TO_DEV(card),
>  			"Failed reading the number of DMA targets\n");
> +		goto failed_dma_setup;
> +	}
>
>  	card->ctrl = kzalloc(card->n_targets * sizeof(*card->ctrl), GFP_KERNEL);
>  	if (!card->ctrl) {
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
