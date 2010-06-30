From: Simon Horman <horms@verge.net.au>
Date: Wed, 30 Jun 2010 00:02:50 +0000
Subject: Re: [PATCH 20/25] usb_main_dev: remove casts from void*
Message-Id: <20100630000250.GC2138@verge.net.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277806573-31384-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1277806573-31384-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Nobhiro KUSUNO <n-kusuno@fc4.so-net.ne.jp>, Sebastian =?utf-8?Q?Dalfu=C3=9F?= <sd@sedf.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Tue, Jun 29, 2010 at 02:16:12PM +0400, Kulikov Vasiliy wrote:
> Remove unnesessary casts from void*.

No objections here.

FWIW, Reviewed-by: Simon Horman <horms@verge.net.au>

> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/staging/rt2860/usb_main_dev.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rt2860/usb_main_dev.c b/drivers/staging/rt2860/usb_main_dev.c
> index b740662..40eab25 100644
> --- a/drivers/staging/rt2860/usb_main_dev.c
> +++ b/drivers/staging/rt2860/usb_main_dev.c
> @@ -421,8 +421,8 @@ int MlmeThread(IN void *Context)
>  	int status;
>  	status = 0;
>  
> -	pTask = (struct rt_rtmp_os_task *)Context;
> -	pAd = (struct rt_rtmp_adapter *)pTask->priv;
> +	pTask = Context;
> +	pAd = pTask->priv;
>  
>  	RtmpOSTaskCustomize(pTask);
>  
> @@ -490,8 +490,8 @@ int RTUSBCmdThread(IN void *Context)
>  	int status;
>  	status = 0;
>  
> -	pTask = (struct rt_rtmp_os_task *)Context;
> -	pAd = (struct rt_rtmp_adapter *)pTask->priv;
> +	pTask = Context;
> +	pAd = pTask->priv;
>  
>  	RtmpOSTaskCustomize(pTask);
>  
> -- 
> 1.7.0.4
