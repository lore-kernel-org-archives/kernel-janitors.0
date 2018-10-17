From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 17 Oct 2018 01:58:35 +0000
Subject: Re: [PATCH -next] scsi: lpfc: Remove set but not used variables 'tgtp'
Message-Id: <yq1woqhnxkk.fsf@oracle.com>
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
> drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_debugfs_nodelist_data':
> drivers/scsi/lpfc/lpfc_debugfs.c:553:29: warning:
>  variable 'tgtp' set but not used [-Wunused-but-set-variable]
>
> It never used since 2b65e18202fd ("scsi: lpfc: NVME Target: Add debugfs support")

Applied to 4.20/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
