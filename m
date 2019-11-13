From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 13 Nov 2019 02:29:55 +0000
Subject: Re: [PATCH -next] scsi: csiostor: Remove set but not used variable 'rln'
Message-Id: <yq136esqzj0.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191029061530.98197-1-yuehaibing@huawei.com>
In-Reply-To: <20191029061530.98197-1-yuehaibing@huawei.com>
        (yuehaibing@huawei.com's message of "Tue, 29 Oct 2019 06:15:30 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/csiostor/csio_lnode.c: In function 'csio_ln_init':
> drivers/scsi/csiostor/csio_lnode.c:1995:21: warning:
>  variable 'rln' set but not used [-Wunused-but-set-variable]
>
> It is never used since introduction, so remove it.

Applied to 5.5/scsi-queue, thanks.

-- 
Martin K. Petersen	Oracle Linux Engineering
