From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 04 Apr 2012 16:19:30 +0000
Subject: Re: [patch] ACPI video: use after input_unregister_device()
Message-Id: <20120404161930.GA9229@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120404111916.GA23719@elgon.mountain>
In-Reply-To: <20120404111916.GA23719@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 04, 2012 at 02:19:16PM +0300, Dan Carpenter wrote:
> We can't use "input" anymore after calling input_unregister_device().
> The call to input_free_device() is a double free.  The normal way to
> deal with this is to make input_register_device() the last function
> called in the function.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Dmitry Torokhov <dtor@mail.ru>

> 
> diff --git a/drivers/acpi/video.c b/drivers/acpi/video.c
> index 9577b6f..51aba50a 100644
> --- a/drivers/acpi/video.c
> +++ b/drivers/acpi/video.c
> @@ -1687,10 +1687,6 @@ static int acpi_video_bus_add(struct acpi_device *device)
>  	set_bit(KEY_BRIGHTNESS_ZERO, input->keybit);
>  	set_bit(KEY_DISPLAY_OFF, input->keybit);
>  
> -	error = input_register_device(input);
> -	if (error)
> -		goto err_stop_video;
> -
>  	printk(KERN_INFO PREFIX "%s [%s] (multi-head: %s  rom: %s  post: %s)\n",
>  	       ACPI_VIDEO_DEVICE_NAME, acpi_device_bid(device),
>  	       video->flags.multihead ? "yes" : "no",
> @@ -1701,12 +1697,16 @@ static int acpi_video_bus_add(struct acpi_device *device)
>  	video->pm_nb.priority = 0;
>  	error = register_pm_notifier(&video->pm_nb);
>  	if (error)
> -		goto err_unregister_input_dev;
> +		goto err_stop_video;
> +
> +	error = input_register_device(input);
> +	if (error)
> +		goto err_unregister_pm_notifier;
>  
>  	return 0;
>  
> - err_unregister_input_dev:
> -	input_unregister_device(input);
> + err_unregister_pm_notifier:
> +	unregister_pm_notifier(&video->pm_nb);
>   err_stop_video:
>  	acpi_video_bus_stop_devices(video);
>   err_free_input_dev:
> 

-- 
Dmitry
