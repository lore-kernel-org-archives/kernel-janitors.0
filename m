From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 16 Oct 2018 22:15:10 +0000
Subject: Re: [PATCH -next] scsi: arcmsr: Remove set but not used variables 'id, lun'
Message-Id: <yq1d0s9r11t.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539340583-117444-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539340583-117444-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/arcmsr/arcmsr_hba.c: In function 'arcmsr_drain_donequeue':
> drivers/scsi/arcmsr/arcmsr_hba.c:1320:10: warning:
>  variable 'lun' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/arcmsr/arcmsr_hba.c:1320:6: warning:
>  variable 'id' set but not used [-Wunused-but-set-variable]

Applied to 4.20/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
