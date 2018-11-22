From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 22 Nov 2018 03:26:49 +0000
Subject: Re: [PATCH -next] scsi: bnx2i: remove set but not used variable 'cid_num'
Message-Id: <yq15zwp7pxi.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541987645-19467-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541987645-19467-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/bnx2i/bnx2i_hwi.c: In function 'bnx2i_process_ofld_cmpl':
> drivers/scsi/bnx2i/bnx2i_hwi.c:2430:6: warning:
>  variable 'cid_num' set but not used [-Wunused-but-set-variable]
>
> It never used since commit
>   cf4e6363859d ("[SCSI] bnx2i: Add bnx2i iSCSI driver.")

Applied to 4.21/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
