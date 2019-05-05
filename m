From: "Alastair D'Silva" <alastair@d-silva.org>
Date: Sun, 05 May 2019 04:46:46 +0000
Subject: RE: [PATCH -next] ocxl: Fix return value check in afu_ioctl()
Message-Id: <01d701d502fd$8c2da240$a488e6c0$@d-silva.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190504070430.57008-1-weiyongjun1@huawei.com>
In-Reply-To: <20190504070430.57008-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Wei Yongjun' <weiyongjun1@huawei.com>, 'Frederic Barrat' <fbarrat@linux.ibm.com>, 'Andrew Donnellan' <ajd@linux.ibm.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

> -----Original Message-----
> From: Wei Yongjun <weiyongjun1@huawei.com>
> Sent: Saturday, 4 May 2019 5:05 PM
> To: Frederic Barrat <fbarrat@linux.ibm.com>; Andrew Donnellan
> <ajd@linux.ibm.com>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-
> Hartman <gregkh@linuxfoundation.org>; Alastair D'Silva <alastair@d-
> silva.org>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linuxppc-
> dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH -next] ocxl: Fix return value check in afu_ioctl()
> 
> In case of error, the function eventfd_ctx_fdget() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 060146614643 ("ocxl: move event_fd handling to frontend")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/misc/ocxl/file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c index
> 8aa22893ed76..2870c25da166 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -257,8 +257,8 @@ static long afu_ioctl(struct file *file, unsigned int
cmd,
>  			return -EINVAL;
>  		irq_id = ocxl_irq_offset_to_id(ctx, irq_fd.irq_offset);
>  		ev_ctx = eventfd_ctx_fdget(irq_fd.eventfd);
> -		if (!ev_ctx)
> -			return -EFAULT;
> +		if (IS_ERR(ev_ctx))
> +			return PTR_ERR(ev_ctx);
>  		rc = ocxl_irq_set_handler(ctx, irq_id, irq_handler,
irq_free,
> ev_ctx);
>  		break;

LGTM

Acked-by: Alastair D'Silva <alastair@d-silva.org>

-- 
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva     msn: alastair@d-silva.org
blog: http://alastair.d-silva.org    Twitter: @EvilDeece
