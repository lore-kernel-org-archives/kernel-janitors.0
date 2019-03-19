From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 19 Mar 2019 21:20:14 +0000
Subject: Re: [PATCH -next] mptfusion: remove set but not used variable 'req_idx, frameOffset'
Message-Id: <yq1k1gublyp.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/message/fusion/mptspi.c: In function 'mptspi_writeIOCPage4':
> drivers/message/fusion/mptspi.c:262:9: warning:
>  variable 'frameOffset' set but not used [-Wunused-but-set-variable]
>
> drivers/message/fusion/mptspi.c:261:9: warning:
>  variable 'req_idx' set but not used [-Wunused-but-set-variable]

Applied to 5.2/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
