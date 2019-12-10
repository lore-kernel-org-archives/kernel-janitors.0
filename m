From: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Date: Tue, 10 Dec 2019 09:57:00 +0000
Subject: Re: [PATCH] scsi: mpt3sas: Fix double free in attach error handling
Message-Id: <CAK=zhgrQ_9R+kWhMWG7D0iqsoTb=Q6WQKhN3ydeCxt-uK-CL-g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191203093652.gyntgvnkw2udatyc@kili.mountain>
In-Reply-To: <20191203093652.gyntgvnkw2udatyc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, PDL-MPT-FUSIONLINUX <MPT-FusionLinux.pdl@broadcom.com>, linux-scsi <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Dec 3, 2019 at 3:07 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The caller also calls _base_release_memory_pools() on error so it
> leads to a number of double frees:
>
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->chain_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->hpr_lookup' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->internal_lookup' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->pcie_sgl_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->reply_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->reply_free_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->reply_post_free_array_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->reply_post_free_dma_pool' double freed
> drivers/scsi/mpt3sas/mpt3sas_base.c:7207 mpt3sas_base_attach() warn: 'ioc->sense_dma_pool' double freed
>
> Fixes: 74522a92bbf0 ("scsi: mpt3sas: Optimize I/O memory consumption in driver.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Sreekanth Reddy <sreekanth.reddy@broadcom.com>

> ---
>  drivers/scsi/mpt3sas/mpt3sas_base.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
> index 848fbec7bda6..45fd8dfb7c40 100644
> --- a/drivers/scsi/mpt3sas/mpt3sas_base.c
> +++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
> @@ -5248,7 +5248,6 @@ _base_allocate_memory_pools(struct MPT3SAS_ADAPTER *ioc)
>                                         &ct->chain_buffer_dma);
>                         if (!ct->chain_buffer) {
>                                 ioc_err(ioc, "chain_lookup: pci_pool_alloc failed\n");
> -                               _base_release_memory_pools(ioc);
>                                 goto out;
>                         }
>                 }
> --
> 2.11.0
>
