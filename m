From: walter harms <wharms@bfs.de>
Date: Fri, 30 Jul 2010 12:31:16 +0000
Subject: Re: [PATCH 3/9] staging: otus: check kmalloc() return value
Message-Id: <4C52C614.4030803@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280488080-20777-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280488080-20777-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alexander Beregalov <a.beregalov@gmail.com>, Tejun Heo <tj@kernel.org>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org



Kulikov Vasiliy schrieb:
> kmalloc() may fail, if so return error from zfwUsbSubmitControl().
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/staging/otus/wrap_usb.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/staging/otus/wrap_usb.c b/drivers/staging/otus/wrap_usb.c
> index 93459ca..9f04047 100644
> --- a/drivers/staging/otus/wrap_usb.c
> +++ b/drivers/staging/otus/wrap_usb.c
> @@ -104,6 +104,11 @@ u32_t zfwUsbSubmitControl(zdev_t *dev, u8_t req, u16_t value, u16_t index,
>  
>  	if (size > 0) {
>  		buf = kmalloc(size, GFP_KERNEL);
> +		if (buf = NULL) {
> +			pr_err("zfwUsbSubmitControl() failed, "
> +				  "kmalloc() returned NULL\n");
> +			return 1;
> +		}
>  		memcpy(buf, (u8_t *)data, size);
>  	} else
>  		buf = NULL;


We had a memdup() somewhere had'nt we ?

re,
 wh
