From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 22 Nov 2019 08:52:25 +0000
Subject: Re: [PATCH -next] scsi: pm80xx: Remove unused including <linux/version.h>
Message-Id: <CAMGffEnCUqFVbOr60wUw3TK_K2_8A=06J8bHj=05pkRUkT4pGA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191122020911.33269-1-yuehaibing@huawei.com>
In-Reply-To: <20191122020911.33269-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 22, 2019 at 3:11 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
Thanks,
> ---
>  drivers/scsi/pm8001/pm80xx_hwi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
> index 19601138e889..6402629bcd40 100644
> --- a/drivers/scsi/pm8001/pm80xx_hwi.c
> +++ b/drivers/scsi/pm8001/pm80xx_hwi.c
> @@ -37,7 +37,6 @@
>   * POSSIBILITY OF SUCH DAMAGES.
>   *
>   */
> - #include <linux/version.h>
>   #include <linux/slab.h>
>   #include "pm8001_sas.h"
>   #include "pm80xx_hwi.h"
>
>
>
