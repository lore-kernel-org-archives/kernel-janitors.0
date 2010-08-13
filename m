From: scameron@beardog.cce.hp.com
Date: Fri, 13 Aug 2010 14:48:08 +0000
Subject: Re: [patch] cciss: handle allocation failure
Message-Id: <20100813144808.GI14939@beardog.cce.hp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100811223740.GD645@bicker>
In-Reply-To: <20100811223740.GD645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 12, 2010 at 12:37:40AM +0200, Dan Carpenter wrote:
> If kmalloc() fails then cleanup and return failure (-1).
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
> index 31064df..937a7c5 100644
> --- a/drivers/block/cciss.c
> +++ b/drivers/block/cciss.c
> @@ -4712,6 +4712,9 @@ static int __devinit cciss_init_one(struct pci_dev *pdev,
>  	h->scatter_list = kmalloc(h->max_commands *
>  						sizeof(struct scatterlist *),
>  						GFP_KERNEL);
> +	if (!h->scatter_list)
> +		goto clean4;
> +
>  	for (k = 0; k < h->nr_cmds; k++) {
>  		h->scatter_list[k] = kmalloc(sizeof(struct scatterlist) *
>  							h->maxsgentries,

Ack.  Thanks.

-- steve
