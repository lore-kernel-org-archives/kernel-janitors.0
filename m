From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 21 Dec 2018 00:47:45 +0000
Subject: Re: [PATCH -next] scsi: fcoe: remove set but not used variable 'port'
Message-Id: <yq14lb7d7ta.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545273824-132149-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1545273824-132149-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/fcoe/fcoe.c: In function 'fcoe_recv_frame':
> drivers/scsi/fcoe/fcoe.c:1672:20: warning:
>  variable 'port' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/fcoe/fcoe.c: In function 'fcoe_device_notification':
> drivers/scsi/fcoe/fcoe.c:1861:20: warning:
>  variable 'port' set but not used [-Wunused-but-set-variable]

Applied to 4.21/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
