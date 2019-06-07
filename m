From: Sumit Saxena <sumit.saxena@broadcom.com>
Date: Fri, 07 Jun 2019 06:26:55 +0000
Subject: Re: [PATCH -next] scsi: megaraid_sas: Remove unused including <linux/version.h>
Message-Id: <CAL2rwxpPh=QEH5WhvsN_=aNhunzNny6B1CVov8p=cuFaMjOpsQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190601031806.46753-1-yuehaibing@huawei.com>
In-Reply-To: <20190601031806.46753-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jun 1, 2019 at 8:40 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Sumit Saxena <sumit.saxena@broadcom.com>

> ---
>  drivers/scsi/megaraid/megaraid_sas_debugfs.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/scsi/megaraid/megaraid_sas_debugfs.c b/drivers/scsi/megaraid/megaraid_sas_debugfs.c
> index e52837bb6807..c69760775efa 100644
> --- a/drivers/scsi/megaraid/megaraid_sas_debugfs.c
> +++ b/drivers/scsi/megaraid/megaraid_sas_debugfs.c
> @@ -25,7 +25,6 @@
>   *
>   *  Send feedback to: megaraidlinux.pdl@broadcom.com
>   */
> -#include <linux/version.h>
>  #include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <linux/pci.h>
>
>
>
>
>
