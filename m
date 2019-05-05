From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Sun, 05 May 2019 14:22:46 +0000
Subject: Re: [PATCH -next] ocxl: Fix return value check in afu_ioctl()
Message-Id: <13d3bd90-1541-e484-ecc9-42b755be80c8@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190504070430.57008-1-weiyongjun1@huawei.com>
In-Reply-To: <20190504070430.57008-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alastair D'Silva <alastair@d-silva.org>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On 4/5/19 5:04 pm, Wei Yongjun wrote:
> In case of error, the function eventfd_ctx_fdget() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 060146614643 ("ocxl: move event_fd handling to frontend")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>   drivers/misc/ocxl/file.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index 8aa22893ed76..2870c25da166 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -257,8 +257,8 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
>   			return -EINVAL;
>   		irq_id = ocxl_irq_offset_to_id(ctx, irq_fd.irq_offset);
>   		ev_ctx = eventfd_ctx_fdget(irq_fd.eventfd);
> -		if (!ev_ctx)
> -			return -EFAULT;
> +		if (IS_ERR(ev_ctx))
> +			return PTR_ERR(ev_ctx);
>   		rc = ocxl_irq_set_handler(ctx, irq_id, irq_handler, irq_free, ev_ctx);
>   		break;
> 
> 
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
