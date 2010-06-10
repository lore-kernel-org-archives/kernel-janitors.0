From: Mike Christie <michaelc@cs.wisc.edu>
Date: Thu, 10 Jun 2010 20:44:05 +0000
Subject: Re: [patch 1/2] be2iscsi: memory leak on error path
Message-Id: <4C114E95.7080401@cs.wisc.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100610075221.GI5483@bicker>
In-Reply-To: <20100610075221.GI5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Jayamohan Kallickal <jayamohank@serverengines.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/10/2010 02:52 AM, Dan Carpenter wrote:
> I added a kfree(pwrb_arr) in front of the return.
>
> Signed-off-by: Dan Carpenter<error27@gmail.com>
>
> diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
> index dd5b105..779e1d1 100644
> --- a/drivers/scsi/be2iscsi/be_main.c
> +++ b/drivers/scsi/be2iscsi/be_main.c
> @@ -2750,6 +2750,7 @@ beiscsi_create_wrb_rings(struct beiscsi_hba *phba,
>   		if (status != 0) {
>   			shost_printk(KERN_ERR, phba->shost,
>   				     "wrbq create failed.");
> +			kfree(pwrb_arr);
>   			return status;
>   		}
>   		phwi_ctrlr->wrb_context[i * 2].cid = phwi_context->be_wrbq[i].


Looks good. Thanks.

Reviewed-by: Mike Christie <michaelc@cs.wisc.edu>
