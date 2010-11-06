From: Kees Cook <kees.cook@canonical.com>
Date: Sat, 06 Nov 2010 17:51:55 +0000
Subject: Re: [PATCH] usb: misc: iowarrior: fix information leak to userland
Message-Id: <20101106175155.GB5327@outflux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289054492-18278-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1289054492-18278-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Arnd Bergmann <arnd@arndb.de>, Oliver Neukum <oliver@neukum.org>, Joe Perches <joe@perches.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Nov 06, 2010 at 05:41:31PM +0300, Vasiliy Kulikov wrote:
> Structure iowarrior_info is copied to userland with padding byted
> between "serial" and "revision" fields uninitialized.  It leads to
> leaking of contents of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: Kees Cook <kees.cook@canonical.com>

> ---
>  Compile tested.
> 
>  drivers/usb/misc/iowarrior.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
> index 3756641..c9078e4 100644
> --- a/drivers/usb/misc/iowarrior.c
> +++ b/drivers/usb/misc/iowarrior.c
> @@ -553,6 +553,7 @@ static long iowarrior_ioctl(struct file *file, unsigned int cmd,
>  			/* needed for power consumption */
>  			struct usb_config_descriptor *cfg_descriptor = &dev->udev->actconfig->desc;
>  
> +			memset(&info, 0, sizeof(info));
>  			/* directly from the descriptor */
>  			info.vendor = le16_to_cpu(dev->udev->descriptor.idVendor);
>  			info.product = dev->product_id;
> -- 
> 1.7.0.4
-- 
Kees Cook
Ubuntu Security Team
