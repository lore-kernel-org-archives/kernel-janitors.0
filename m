From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 17 Sep 2018 06:34:36 +0000
Subject: Re: [PATCH -next] scsi: aic7xxx: remove set but not used variable 'shared_scb_data'
Message-Id: <yq1tvmoskcj.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536032161-124423-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536032161-124423-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/aic7xxx/aic79xx_pci.c: In function 'ahd_pci_config':
> drivers/scsi/aic7xxx/aic79xx_pci.c:291:19: warning:
>  variable 'shared_scb_data' set but not used [-Wunused-but-set-variable]

Applied to 4.20/scsi-queue, thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
