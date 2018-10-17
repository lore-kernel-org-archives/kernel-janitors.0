From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 17 Oct 2018 01:47:06 +0000
Subject: Re: [PATCH -next] scsi: lpfc: Remove set but not used variable 'psli'
Message-Id: <yq15zy1pco5.fsf@oracle.com>
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
> drivers/scsi/lpfc/lpfc_hbadisc.c: In function 'lpfc_free_tx':
> drivers/scsi/lpfc/lpfc_hbadisc.c:5431:19: warning:
>  variable 'psli' set but not used [-Wunused-but-set-variable]
>
> Since commit 895427bd012c ("scsi: lpfc: NVME Initiator: Base modifications")
> 'psli' is not used any more.

Applied to 4.20/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
