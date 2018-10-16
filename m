From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 16 Oct 2018 22:33:11 +0000
Subject: Re: [PATCH -next] scsi: megaraid: remove set but not used variables
Message-Id: <yq1va61plnc.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180926110940.16024-1-yuehaibing@huawei.com>
In-Reply-To: <20180926110940.16024-1-yuehaibing@huawei.com>
        (yuehaibing@huawei.com's message of "Wed, 26 Sep 2018 19:09:40 +0800")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: kashyap.desai@broadcom.com, sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, linux-kernel@vger.kernel.org, megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/megaraid/megaraid_mbox.c: In function 'megaraid_mbox_sync_scb':
> drivers/scsi/megaraid/megaraid_mbox.c:2193:14: warning:
>  variable 'ccb' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/megaraid/megaraid_mbox.c: In function 'megaraid_reset_handler':
> drivers/scsi/megaraid/megaraid_mbox.c:2580:7: warning:
>  variable 'recovering' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/megaraid/megaraid_mbox.c: In function 'mbox_post_sync_cmd':
> drivers/scsi/megaraid/megaraid_mbox.c:2728:12: warning:
>  variable 'mbox64' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/megaraid/megaraid_mbox.c: In function 'megaraid_mbox_support_random_del':
> drivers/scsi/megaraid/megaraid_mbox.c:3138:11: warning:
>  variable 'mbox' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/megaraid/megaraid_mbox.c: In function 'megaraid_mbox_flush_cache':
> drivers/scsi/megaraid/megaraid_mbox.c:3266:10: warning:
>  variable 'mbox' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/megaraid/megaraid_mbox.c: In function 'megaraid_mbox_fire_sync_cmd':
> drivers/scsi/megaraid/megaraid_mbox.c:3302:12: warning:
>  variable 'mbox64' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/megaraid/megaraid_mbox.c: In function 'gather_hbainfo':
> drivers/scsi/megaraid/megaraid_mbox.c:3797:10: warning:
>  variable 'dmajor' set but not used [-Wunused-but-set-variable]

Applied by hand to 4.20/scsi-queue due to conflict with Christoph's DMA
API cleanup.

-- 
Martin K. Petersen	Oracle Linux Engineering
