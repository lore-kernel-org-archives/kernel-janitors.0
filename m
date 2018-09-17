From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 17 Sep 2018 07:02:46 +0000
Subject: Re: [PATCH -next] scsi: qla2xxx: Remove set but not used variable 'ptr_dma'
Message-Id: <yq1r2hsr4h5.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536806456-124627-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536806456-124627-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/qla2xxx/qla_iocb.c: In function 'qla24xx_els_dcmd2_iocb':
> drivers/scsi/qla2xxx/qla_iocb.c:2644:13: warning:
>  variable 'ptr_dma' set but not used [-Wunused-but-set-variable]

Applied to 4.20/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
