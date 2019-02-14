From: James Smart <james.smart@broadcom.com>
Date: Thu, 14 Feb 2019 18:52:35 +0000
Subject: Re: [PATCH -next] scsi: lpfc: Remove set but not used variable 'phys_id'
Message-Id: <4c2b2d3e-dc0c-84a7-7103-e0dcf6a2e7b0@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org



On 2/13/2019 5:51 PM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/lpfc/lpfc_init.c: In function 'lpfc_cpu_affinity_check':
> drivers/scsi/lpfc/lpfc_init.c:10599:19: warning:
>   variable 'phys_id' set but not used [-Wunused-but-set-variable]
>
> It never used since introduction in commit 6a828b0f6192 ("scsi: lpfc: Support
> non-uniform allocation of MSIX vectors to hardware queues")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/scsi/lpfc/lpfc_init.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
>
Looks fine. Thanks

Signed-off-by:   James Smart  <james.smart@broadcom.com>

-- james
