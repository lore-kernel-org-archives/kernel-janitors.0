From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 10 Oct 2011 05:08:52 +0000
Subject: Re: [patch] Input: force feedback - potential integer wrap in
Message-Id: <20111010050852.GA18794@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111009162524.GA14049@elgon.mountain>
In-Reply-To: <20111009162524.GA14049@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Sun, Oct 09, 2011 at 07:25:24PM +0300, Dan Carpenter wrote:
> Smatch complains about max_effects because it's an int and we cap the
> maximum size, but we don't check for negative.  A negative value here
> could make "ff" smaller than sizeof(struct ff_device) and lead to
> memory corruption.
> 
> I think max_effects can come from ->ff_effects_max in
> uinput_setup_device() and that comes from the user so potentially
> it could be negative.  The call path is that uinput_setup_device()
> sets the value in the ->private_data struct.  From there it is:
> -> uinput_ioctl_handler()
>    -> uinput_create_device()
>       -> input_ff_create(dev, udev->ff_effects_max);
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
> index 3367f76..12422ed 100644
> --- a/drivers/input/ff-core.c
> +++ b/drivers/input/ff-core.c
> @@ -319,6 +319,12 @@ int input_ff_create(struct input_dev *dev, int max_effects)
>  		return -EINVAL;
>  	}
>  
> +	if (max_effects < 0)
> +		return -EINVAL;
> +	if (sizeof(struct ff_device) + max_effects * sizeof(struct file *) <
> +			max_effects)
> +		return -EINVAL;
> +

Instead of doing this why don't we mark all relevant fields as unsigned
int?

Thanks.

-- 
Dmitry
