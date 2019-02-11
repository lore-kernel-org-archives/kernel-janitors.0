From: "Ewan D. Milne" <emilne@redhat.com>
Date: Mon, 11 Feb 2019 20:19:30 +0000
Subject: Re: [PATCH] scsi: lpfc: Fix error code if kcalloc() fails
Message-Id: <0ac385488a79c5c93167ce1babe9e70b84ad4799.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190211184300.GA22106@kadam>
In-Reply-To: <20190211184300.GA22106@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 2019-02-11 at 21:43 +0300, Dan Carpenter wrote:
> This should return -ENOMEM if kcalloc() fails, but it accidentally
> returns success instead.
> 
> Fixes: 6a828b0f6192 ("scsi: lpfc: Support non-uniform allocation of MSIX vectors to hardware queues")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/scsi/lpfc/lpfc_init.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
> index 900edae7ccc4..aa801d2f36e5 100644
> --- a/drivers/scsi/lpfc/lpfc_init.c
> +++ b/drivers/scsi/lpfc/lpfc_init.c
> @@ -9638,6 +9638,7 @@ lpfc_sli4_queue_setup(struct lpfc_hba *phba)
>  			lpfc_printf_log(phba, KERN_ERR, LOG_INIT,
>  					"0549 Failed setup of CQ Lookup table: "
>  					"size 0x%x\n", phba->sli4_hba.cq_max);
> +			rc = -ENOMEM;
>  			goto out_destroy;
>  		}
>  		lpfc_setup_cq_lookup(phba);

Reviewed-by: Ewan D. Milne <emilne@redhat.com>
