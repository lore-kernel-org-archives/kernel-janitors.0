From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 19 Mar 2019 21:46:00 +0000
Subject: Re: [PATCH -next] scsi: qedi: Remove set but not used variable 'cls_sess'
Message-Id: <yq17ecubkrr.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/qedi/qedi_fw.c: In function 'qedi_tmf_resp_work':
> drivers/scsi/qedi/qedi_fw.c:158:28: warning:
>  variable 'cls_sess' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/qedi/qedi_fw.c: In function 'qedi_tmf_work':
> drivers/scsi/qedi/qedi_fw.c:1370:28: warning:
>  variable 'cls_sess' set but not used [-Wunused-but-set-variable]

Applied to 5.2/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
