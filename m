From: "Alastair D'Silva" <alastair@d-silva.org>
Date: Tue, 05 Jun 2018 09:41:11 +0000
Subject: RE: [PATCH -next] ocxl: Fix missing unlock on error in afu_ioctl_enable_p9_wait()
Message-Id: <078c01d3fcb1$57ca6810$075f3830$@d-silva.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1528190181-15745-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1528190181-15745-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Wei Yongjun' <weiyongjun1@huawei.com>, 'Frederic Barrat' <fbarrat@linux.vnet.ibm.com>, 'Andrew Donnellan' <andrew.donnellan@au1.ibm.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Wei Yongjun <weiyongjun1@huawei.com>
> Sent: Tuesday, 5 June 2018 7:16 PM
> To: Frederic Barrat <fbarrat@linux.vnet.ibm.com>; Andrew Donnellan
> <andrew.donnellan@au1.ibm.com>; Arnd Bergmann <arnd@arndb.de>;
> Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Alastair D'Silva
> <alastair@d-silva.org>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linuxppc-
> dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH -next] ocxl: Fix missing unlock on error in
> afu_ioctl_enable_p9_wait()
> 
> Add the missing unlock before return from function
> afu_ioctl_enable_p9_wait() in the error handling case.
> 
> Fixes: e948e06fc63a ("ocxl: Expose the thread_id needed for wait on
> POWER9")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/misc/ocxl/file.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c index
> 33ae46c..e6a6074 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -139,8 +139,10 @@ static long afu_ioctl_enable_p9_wait(struct
> ocxl_context *ctx,
>  		// Locks both status & tidr
>  		mutex_lock(&ctx->status_mutex);
>  		if (!ctx->tidr) {
> -			if (set_thread_tidr(current))
> +			if (set_thread_tidr(current)) {
> +				mutex_unlock(&ctx->status_mutex);
>  				return -ENOENT;
> +			}
> 
>  			ctx->tidr = current->thread.tidr;
>  		}


Thanks for picking that up!

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>

-- 
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva     msn: alastair@d-silva.org
blog: http://alastair.d-silva.org    Twitter: @EvilDeece


