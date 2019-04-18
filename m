From: Mukesh Ojha <mojha@codeaurora.org>
Date: Thu, 18 Apr 2019 10:53:01 +0000
Subject: Re: [PATCH] scsi: aic7xxx: fix spelling mistake "recevied" -> "received"
Message-Id: <a8edb273-1350-3387-900c-4ce7d80bd5dd@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190418102025.10021-1-colin.king@canonical.com>
In-Reply-To: <20190418102025.10021-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Hannes Reinecke <hare@suse.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/18/2019 3:50 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a kernel message, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   drivers/scsi/aic7xxx/aic7xxx_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/aic7xxx/aic7xxx_core.c b/drivers/scsi/aic7xxx/aic7xxx_core.c
> index d4a7263e4b8f..a9d40d3b90ef 100644
> --- a/drivers/scsi/aic7xxx/aic7xxx_core.c
> +++ b/drivers/scsi/aic7xxx/aic7xxx_core.c
> @@ -1666,7 +1666,7 @@ ahc_handle_scsiint(struct ahc_softc *ahc, u_int intstat)
>   					printk("\tCRC Value Mismatch\n");
>   				if ((sstat2 & CRCENDERR) != 0)
>   					printk("\tNo terminal CRC packet "
> -					       "recevied\n");
> +					       "received\n");
>   				if ((sstat2 & CRCREQERR) != 0)
>   					printk("\tIllegal CRC packet "
>   					       "request\n");
