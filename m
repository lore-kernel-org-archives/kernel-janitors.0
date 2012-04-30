From: Dan Carpenter <error27@gmail.com>
Date: Mon, 30 Apr 2012 16:03:46 +0000
Subject: Re: [patch 2/2] [SCSI] pmcraid: cpu_to_le32() => cpu_to_le64()
Message-Id: <CA+_b7DK0SogSMQVKP0KoBwOpCoidO=U__AaUr4YuEd4DJV4k=g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111216102137.GB4287@elgon.mountain>
In-Reply-To: <20111216102137.GB4287@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anil Ravindranath <anil_ravindranath@pmc-sierra.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

ping?

regards,
dan carpenter

On 12/16/11, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The cpu_to_le32() truncates the address to 32 bits.  All the other
> places that set .address use cpu_to_le64().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> What about if dma_addr_t is 32 bits on a big endian system?  Can that
> happen?
>
> diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
> index d6bc4e6..8a239ea 100644
> --- a/drivers/scsi/pmcraid.c
> +++ b/drivers/scsi/pmcraid.c
> @@ -1242,7 +1242,7 @@ static struct pmcraid_cmd *pmcraid_init_hcam
>
>  	ioadl[0].flags |= IOADL_FLAGS_READ_LAST;
>  	ioadl[0].data_len = cpu_to_le32(rcb_size);
> -	ioadl[0].address = cpu_to_le32(dma);
> +	ioadl[0].address = cpu_to_le64(dma);
>
>  	cmd->cmd_done = cmd_done;
>  	return cmd;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
