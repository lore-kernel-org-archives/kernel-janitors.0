From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 22 Nov 2018 03:15:06 +0000
Subject: Re: [PATCH -next] scsi: libfc: Remove set but not used variable 'disc'
Message-Id: <yq1va4p7qh1.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536031867-65592-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536031867-65592-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> From: Yue Haibing <yuehaibing@huawei.com>
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/libfc/fc_rport.c: In function 'fc_rport_recv_flogi_req':
> drivers/scsi/libfc/fc_rport.c:866:18: warning:
>  variable 'disc' set but not used [-Wunused-but-set-variable]
>
> It no used any more after
> commit baa6719f902a ï¼ˆ"libfc: Update rport reference counting")
                      ^^^

Please run checkpatch. Fixed it up and applied to 4.21/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
