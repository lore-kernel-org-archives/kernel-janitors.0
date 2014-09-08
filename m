From: Juergen Gross <jgross@suse.com>
Date: Mon, 08 Sep 2014 11:30:05 +0000
Subject: Re: [Xen-devel] [patch] xen-scsifront: use GFP_ATOMIC under spin_lock
Message-Id: <540D933D.9020809@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140908111542.GA6947@mwanda>
In-Reply-To: <20140908111542.GA6947@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <JBottomley@parallels.com>, David Vrabel <david.vrabel@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>

On 09/08/2014 01:15 PM, Dan Carpenter wrote:
> This function is only called with a spin_lock held and IRQs disabled.
> The allocation is not allowed to sleep and NOIO is not sufficient, it
> has to be ATOMIC.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks,

Juergen

>
> diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
> index 0aceb70..7e88659 100644
> --- a/drivers/scsi/xen-scsifront.c
> +++ b/drivers/scsi/xen-scsifront.c
> @@ -359,7 +359,7 @@ static int map_data_for_request(struct vscsifrnt_info *info,
>   		}
>   		seg_grants = vscsiif_grants_sg(data_grants);
>   		shadow->sg = kcalloc(data_grants,
> -			sizeof(struct scsiif_request_segment), GFP_NOIO);
> +			sizeof(struct scsiif_request_segment), GFP_ATOMIC);
>   		if (!shadow->sg)
>   			return -ENOMEM;
>   	}
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xen.org
> http://lists.xen.org/xen-devel
>

