From: Jiri Kosina <jkosina@suse.cz>
Date: Wed, 24 Aug 2011 14:40:11 +0000
Subject: Re: [patch -next] HID: unlock on error path in hid_device_probe()
Message-Id: <alpine.LNX.2.00.1108241640010.13644@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110824112745.GB5975@shale.localdomain>
In-Reply-To: <20110824112745.GB5975@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: dh.herrmann@googlemail.com, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, 24 Aug 2011, Dan Carpenter wrote:

> We recently introduced locking into this function, but we missed an
> error path which needs an unlock.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 582be00..ed0cd09 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -1643,8 +1643,10 @@ static int hid_device_probe(struct device *dev)
>  
>  	if (!hdev->driver) {
>  		id = hid_match_device(hdev, hdrv);
> -		if (id = NULL)
> -			return -ENODEV;
> +		if (id = NULL) {
> +			ret = -ENODEV;
> +			goto unlock;
> +		}
>  
>  		hdev->driver = hdrv;
>  		if (hdrv->probe) {
> @@ -1657,7 +1659,7 @@ static int hid_device_probe(struct device *dev)
>  		if (ret)
>  			hdev->driver = NULL;
>  	}
> -
> +unlock:
>  	up(&hdev->driver_lock);
>  	return ret;
>  }

Good catch Dan, thanks. Applied.

-- 
Jiri Kosina
SUSE Labs
