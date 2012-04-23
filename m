From: Mike Miller <mike.miller@hp.com>
Date: Mon, 23 Apr 2012 15:01:19 +0000
Subject: Re: [PATCH] drivers/block/cpqarray.c: add missing cmd_free
Message-Id: <4F956EBF.7020506@hp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335086112-10528-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1335086112-10528-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Chirag Kantharia <chirag.kantharia@hp.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, ISS StorageDev <iss_storagedev@hp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 04/22/2012 04:15 AM, Julia Lawall wrote:
> From: Julia Lawall<Julia.Lawall@lip6.fr>
>
> Call cmd_free(h, c, 0); before leaving the function as done on all other
> exit paths.
>
> Signed-off-by: Julia Lawall<Julia.Lawall@lip6.fr>
Acked-by: Mike Miller <mike.miller@hp.com>
>
> ---
>   drivers/block/cpqarray.c |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/block/cpqarray.c b/drivers/block/cpqarray.c
> index 9125bbe..db6f15d 100644
> --- a/drivers/block/cpqarray.c
> +++ b/drivers/block/cpqarray.c
> @@ -1334,6 +1334,7 @@ static int ida_ctlr_ioctl(ctlr_info_t *h, int dsk, ida_ioctl_t *io)
>   	case READ_FLASH_ROM:
>   		if (copy_to_user(io->sg[0].addr, p, io->sg[0].size)) {
>   			kfree(p);
> +			cmd_free(h, c, 0);
>   			return -EFAULT;
>   		}
>   		/* fall through and free p */
>

