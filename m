From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 17 Sep 2018 07:02:04 +0000
Subject: Re: [PATCH -next] scsi: lpfc: Remove set but not used variable 'sgl_size'
Message-Id: <yq1va74r4ib.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/lpfc/lpfc_nvme.c: In function 'lpfc_new_nvme_buf':
> drivers/scsi/lpfc/lpfc_nvme.c:2238:24: warning:
>  variable 'sgl_size' set but not used [-Wunused-but-set-variable]
>   int bcnt, num_posted, sgl_size;
>                         ^

Applied to 4.20/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
