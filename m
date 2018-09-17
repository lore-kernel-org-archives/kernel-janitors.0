From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 17 Sep 2018 06:23:33 +0000
Subject: Re: [PATCH -next] scsi: pm80xx: Remove set but not used variable 'device_id'
Message-Id: <yq17ejktzfe.fsf@oracle.com>
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
> drivers/scsi/pm8001/pm8001_sas.c: In function 'pm8001_I_T_nexus_event_handler':
> drivers/scsi/pm8001/pm8001_sas.c:1052:6: warning:
>  variable 'device_id' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/pm8001/pm8001_sas.c: In function 'pm8001_abort_task':
> drivers/scsi/pm8001/pm8001_sas.c:1191:6: warning:
>  variable 'device_id' set but not used [-Wunused-but-set-variable]

Applied to 4.20/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
