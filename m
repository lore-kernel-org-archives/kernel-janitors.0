From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 24 Oct 2018 01:37:29 +0000
Subject: Re: [PATCH -next] mvsas: Remove set but not used variable 'id'
Message-Id: <yq1sh0wf7l2.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540115454-160677-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1540115454-160677-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/mvsas/mv_sas.c: In function 'mvs_work_queue':
> drivers/scsi/mvsas/mv_sas.c:1909:31: warning:
>  variable 'id' set but not used [-Wunused-but-set-variable]
>
> It never used since introduction in commit
> 20b09c2992fe ("[SCSI] mvsas: add support for 94xx; layout change; bug fixes")

Applied to 4.20/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
