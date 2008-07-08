From: "Mark Asselstine" <mark.asselstine@windriver.com>
Date: Tue, 08 Jul 2008 13:04:51 +0000
Subject: Re: [PATCH] scsi_cmnd.h: remove double inclusion of linux/blkdev.h
Message-Id: <919fe2b30807080604x68620b15ndf0bd81605df6834@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a4423d670807060601sa56948ak812c4569297fada6@mail.gmail.com>
In-Reply-To: <a4423d670807060601sa56948ak812c4569297fada6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: James.Bottomley@hansenpartnership.com, bharrosh@panasas.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Jul 6, 2008 at 9:01 AM, Alexander Beregalov
<a.beregalov@gmail.com> wrote:
> From: Alexander Beregalov <a.beregalov@gmail.com>
>
> Remove double inclusion of linux/blkdev.h
>
>  include/scsi/scsi_cmnd.h |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
>
> diff --git a/include/scsi/scsi_cmnd.h b/include/scsi/scsi_cmnd.h
> index 3e46dfa..66c9448 100644
> --- a/include/scsi/scsi_cmnd.h
> +++ b/include/scsi/scsi_cmnd.h
> @@ -7,7 +7,6 @@
>  #include <linux/types.h>
>  #include <linux/timer.h>
>  #include <linux/scatterlist.h>
> -#include <linux/blkdev.h>
>

Reviewed-by: Mark Asselstine <mark.asselstine@windriver.com>

>  struct Scsi_Host;
>  struct scsi_device;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
