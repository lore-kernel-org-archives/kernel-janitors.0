From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 01 Oct 2019 02:38:28 +0000
Subject: Re: [PATCH -next] scsi: smartpqi: remove set but not used variable 'ctrl_info'
Message-Id: <yq1muelyyu3.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190831130348.20552-1-yuehaibing@huawei.com>
In-Reply-To: <20190831130348.20552-1-yuehaibing@huawei.com>
        (yuehaibing@huawei.com's message of "Sat, 31 Aug 2019 13:03:48 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Don Brace <don.brace@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Murthy Bhat <Murthy.Bhat@microsemi.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, esc.storagedev@microsemi.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/smartpqi/smartpqi_init.c: In function 'pqi_driver_version_show':
> drivers/scsi/smartpqi/smartpqi_init.c:6164:24: warning:
>  variable 'ctrl_info' set but not used [-Wunused-but-set-variable]

Applied to 5.5/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
