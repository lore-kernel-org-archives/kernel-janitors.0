From: Jeff Garzik <jgarzik@pobox.com>
Date: Thu, 10 Jun 2010 20:14:35 +0000
Subject: Re: [patch] sata_sil24: memset() overflow
Message-Id: <4C1147AB.5050604@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100609120153.GF5483@bicker>
In-Reply-To: <20100609120153.GF5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Tejun Heo <tj@kernel.org>, Robert Hancock <hancockrwd@gmail.com>, Vivek Mahajan <vivek.mahajan@freescale.com>, linux-ide@vger.kernel.org, linux-kern

On 06/09/2010 08:01 AM, Dan Carpenter wrote:
> cb->atapi.cdb is an array of 16 u8 elements.  The call too memset()
> would set the first part of the sge array to zero as well.  It's not
> a packed struct.
>
> This one has been around for five years.  I found it with Smatch.  I
> think the reason no one has seen it before is because we normally call
> sil24_fill_sg() and that overwrites sge with proper information?
>
> Signed-off-by: Dan Carpenter<error27@gmail.com>
> ---
> I don't have this hardware myself so I can't test it.  Sorry. :(
>
> diff --git a/drivers/ata/sata_sil24.c b/drivers/ata/sata_sil24.c
> index e925051..9e459eb 100644
> --- a/drivers/ata/sata_sil24.c
> +++ b/drivers/ata/sata_sil24.c
> @@ -865,7 +865,7 @@ static void sil24_qc_prep(struct ata_queued_cmd *qc)
>   	} else {
>   		prb =&cb->atapi.prb;
>   		sge = cb->atapi.sge;
> -		memset(cb->atapi.cdb, 0, 32);
> +		memset(cb->atapi.cdb, 0, sizeof(cb->atapi.cdb));
>   		memcpy(cb->atapi.cdb, qc->cdb, qc->dev->cdb_len);

applied


