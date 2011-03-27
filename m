From: Jiri Kosina <jkosina@suse.cz>
Date: Sun, 27 Mar 2011 09:15:27 +0000
Subject: Re: [patch] HID: fix a tab problem
Message-Id: <alpine.LNX.2.00.1103271115050.26754@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110326014735.GE2008@bicker>
In-Reply-To: <20110326014735.GE2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 26 Mar 2011, Dan Carpenter wrote:

> There was an extra tab so the close curly brace didn't match up with
> the right if statement.

Applied, thanks.

> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
> index af0a7c1..5270031 100644
> --- a/drivers/hid/usbhid/hiddev.c
> +++ b/drivers/hid/usbhid/hiddev.c
> @@ -509,7 +509,7 @@ static noinline int hiddev_ioctl_usage(struct hiddev *hiddev, unsigned int cmd,
>  				 (uref_multi->num_values > HID_MAX_MULTI_USAGES ||
>  				  uref->usage_index + uref_multi->num_values > field->report_count))
>  				goto inval;
> -			}
> +		}
>  
>  		switch (cmd) {
>  		case HIDIOCGUSAGE:
> 

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
