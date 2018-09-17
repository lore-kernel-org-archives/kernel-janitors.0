From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 17 Sep 2018 06:52:42 +0000
Subject: Re: [PATCH -next] scsi: bnx2fc: Remove set but not used variable 'oxid'
Message-Id: <yq17ejksjid.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536720652-106193-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536720652-106193-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/bnx2fc/bnx2fc_fcoe.c: In function 'bnx2fc_rcv':
> drivers/scsi/bnx2fc/bnx2fc_fcoe.c:435:17: warning:
>  variable 'oxid' set but not used [-Wunused-but-set-variable]

Applied to 4.20/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
