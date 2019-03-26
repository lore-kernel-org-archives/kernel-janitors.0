From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 26 Mar 2019 02:21:18 +0000
Subject: Re: [PATCH -next] pm8001: remove set but not used variables 'param, sas_ha'
Message-Id: <yq1lg12z881.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323021559.113157-1-yuehaibing@huawei.com>
In-Reply-To: <20190323021559.113157-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/pm8001/pm8001_hwi.c: In function 'mpi_smp_completion':
> drivers/scsi/pm8001/pm8001_hwi.c:2901:6: warning:
>  variable 'param' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/pm8001/pm8001_hwi.c: In function 'pm8001_bytes_dmaed':
> drivers/scsi/pm8001/pm8001_hwi.c:3247:24: warning:
>  variable 'sas_ha' set but not used [-Wunused-but-set-variable]
>
> They're never used since introduction, so can be removed.

Applied to 5.2/scsi-queue, thanks.

-- 
Martin K. Petersen	Oracle Linux Engineering
