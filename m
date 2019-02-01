From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 01 Feb 2019 23:20:59 +0000
Subject: Re: [PATCH -next] scsi: csiostor: Remove set but not used variable 'pln'
Message-Id: <yq1a7jf5c4k.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548381439-97080-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1548381439-97080-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/csiostor/csio_attr.c: In function 'csio_fcoe_free_vnp':
> drivers/scsi/csiostor/csio_attr.c:500:21: warning:
>  variable 'pln' set but not used [-Wunused-but-set-variable]

Applied to 5.1/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
