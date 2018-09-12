From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 12 Sep 2018 01:00:50 +0000
Subject: Re: [PATCH -next] scsi: libfc: remove set but not used variable 'rpriv'
Message-Id: <yq1ftyfy1fh.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536031867-65592-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536031867-65592-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/libfc/fc_fcp.c: In function 'fc_queuecommand':
> drivers/scsi/libfc/fc_fcp.c:1875:30: warning:
>  variable 'rpriv' set but not used [-Wunused-but-set-variable]

Applied to 4.20/scsi-queue. Thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
