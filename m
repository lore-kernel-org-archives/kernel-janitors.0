From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 10 Dec 2019 00:01:25 +0000
Subject: Re: [PATCH] scsi: mpt3sas: Fix double free in attach error handling
Message-Id: <yq1sgltoxpm.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191203093652.gyntgvnkw2udatyc@kili.mountain>
In-Reply-To: <20191203093652.gyntgvnkw2udatyc@kili.mountain> (Dan Carpenter's
        message of "Tue, 3 Dec 2019 12:36:52 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


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

Broadcom: Please review!

-- 
Martin K. Petersen	Oracle Linux Engineering
