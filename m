From: Sagi Grimberg <sagi@grimberg.me>
Date: Mon, 24 Aug 2020 20:00:11 +0000
Subject: Re: [PATCH] nvmet-fc: Fix a missed _irqsave version of spin_lock in 'nvmet_fc_fod_op_done()'
Message-Id: <823cd0d7-1688-7d11-1e9b-2de29b6065a6@grimberg.me>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200821075819.152474-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200821075819.152474-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, james.smart@broadcom.com, hch@lst.de, chaitanya.kulkarni@wdc.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org

> The way 'spin_lock()' and 'spin_lock_irqsave()' are used is not consistent
> in this function.
> 
> Use 'spin_lock_irqsave()' also here, as there is no guarantee that
> interruptions are disabled at that point, according to surrounding code.
> 
> Fixes: a97ec51b37ef ("nvmet_fc: Rework target side abort handling")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not tested, only based on what looks logical to me according to
> surrounding code
> ---
>   drivers/nvme/target/fc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
> index 55bafd56166a..e6861cc10e7d 100644
> --- a/drivers/nvme/target/fc.c
> +++ b/drivers/nvme/target/fc.c
> @@ -2342,9 +2342,9 @@ nvmet_fc_fod_op_done(struct nvmet_fc_fcp_iod *fod)
>   			return;
>   		if (fcpreq->fcp_error ||
>   		    fcpreq->transferred_length != fcpreq->transfer_length) {
> -			spin_lock(&fod->flock);
> +			spin_lock_irqsave(&fod->flock, flags);
>   			fod->abort = true;
> -			spin_unlock(&fod->flock);
> +			spin_unlock_irqrestore(&fod->flock, flags);
>   
>   			nvmet_req_complete(&fod->req, NVME_SC_INTERNAL);
>   			return;
> 

James, can I get a reviewed-by from you on this?
