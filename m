From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 05 Jun 2018 12:57:00 +0000
Subject: Re: [PATCH -next] ocxl: Fix missing unlock on error in afu_ioctl_enable_p9_wait()
Message-Id: <eb4f541f-cd2a-2af6-0770-fc8cc4f4063b@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1528190181-15745-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1528190181-15745-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alastair D'Silva <alastair@d-silva.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Le 05/06/2018 à 11:16, Wei Yongjun a écrit :
> Add the missing unlock before return from function
> afu_ioctl_enable_p9_wait() in the error handling case.
> 
> Fixes: e948e06fc63a ("ocxl: Expose the thread_id needed for wait on POWER9")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   drivers/misc/ocxl/file.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index 33ae46c..e6a6074 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -139,8 +139,10 @@ static long afu_ioctl_enable_p9_wait(struct ocxl_context *ctx,
>   		// Locks both status & tidr
>   		mutex_lock(&ctx->status_mutex);
>   		if (!ctx->tidr) {
> -			if (set_thread_tidr(current))
> +			if (set_thread_tidr(current)) {
> +				mutex_unlock(&ctx->status_mutex);
>   				return -ENOENT;
> +			}

O_o   Thanks for fixing it

Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>


>   			ctx->tidr = current->thread.tidr;
>   		}
> 

