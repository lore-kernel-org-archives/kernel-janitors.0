From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 17 Sep 2018 06:26:57 +0000
Subject: Re: [PATCH -next] scsi: pm80xx: Remove set but not used variable 'page_code'
Message-Id: <yq136u8tz9q.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536803664-42497-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536803664-42497-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/pm8001/pm80xx_hwi.c: In function 'pm8001_set_phy_profile':
> drivers/scsi/pm8001/pm80xx_hwi.c:4679:6: warning:
>  variable 'page_code' set but not used [-Wunused-but-set-variable]

Applied to 4.20/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
