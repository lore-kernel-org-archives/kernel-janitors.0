From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 27 Apr 2020 20:21:23 +0000
Subject: Re: [PATCH -next] scsi: bfa: Remove set but not used variable 'fchs'
Message-Id: <158777063305.4076.8196764911288464111.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200418071057.96699-1-yuehaibing@huawei.com>
In-Reply-To: <20200418071057.96699-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Anil Gurumurthy <anil.gurumurthy@qlogic.com>, Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org

On Sat, 18 Apr 2020 07:10:57 +0000, YueHaibing wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/scsi/bfa/bfa_svc.c: In function 'uf_recv':
> drivers/scsi/bfa/bfa_svc.c:5520:17: warning:
>  variable 'fchs' set but not used [-Wunused-but-set-variable]
>   struct fchs_s *fchs;
>                  ^
> 
> [...]

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: bfa: Remove set but not used variable 'fchs'
      https://git.kernel.org/mkp/scsi/c/0745c834f793

-- 
Martin K. Petersen	Oracle Linux Engineering
