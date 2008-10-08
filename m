From: Len Brown <lenb@kernel.org>
Date: Wed, 08 Oct 2008 20:34:37 +0000
Subject: Re: [PATCH] drivers/acpi: dereference without an error test
Message-Id: <alpine.LFD.1.10.0810081634300.3041@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200809261551.58262.brunel@diku.dk>
In-Reply-To: <200809261551.58262.brunel@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Brunel <brunel@diku.dk>
Cc: rui.zhang@intel.com, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

applied.

thanks,
-len

On Fri, 26 Sep 2008, Julien Brunel wrote:

> After a variable is assigned the result of backlight_device_register, an error
> test should be performed before a dereference. 
> 
> A simplified version of the semantic match that finds this problem is
> as follows: 
> (http://www.emn.fr/x-info/coccinelle/)
> // <smpl>
> @def0@
> expression x;
> position p0;
> @@
> 
> x@p0 = backlight_device_register(...)
> 
> @protected@
> expression def0.x,E;
> position def0.p0;
> position p;
> statement S;
> @@
> x@p0
> ... when != x = E
> if (!IS_ERR(x) && ...) {<... x@p ...>} else S
> 
> @unprotected@
> expression def0.x,E;
> identifier fld;
> position def0.p0;
> position p != protected.p;
> @@
> x@p0
> ... when != x = E
> * x@p->fld
> // </smpl>
> 
> Signed-off-by: Julien Brunel <brunel@diku.dk>
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/acpi/video.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff -u -p a/drivers/acpi/video.c b/drivers/acpi/video.c
> --- a/drivers/acpi/video.c
> +++ b/drivers/acpi/video.c
> @@ -752,6 +752,8 @@ static void acpi_video_device_find_cap(s
>  		sprintf(name, "acpi_video%d", count++);
>  		device->backlight = backlight_device_register(name,
>  			NULL, device, &acpi_backlight_ops);
> +		if (IS_ERR(device->backlight))
> +			return;
>  		device->backlight->props.max_brightness = device->brightness->count-3;
>  		/*
>  		 * If there exists the _BQC object, the _BQC object will be
> --
> To unsubscribe from this list: send the line "unsubscribe linux-acpi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
