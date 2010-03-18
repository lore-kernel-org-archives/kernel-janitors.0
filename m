From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 18 Mar 2010 23:25:29 +0000
Subject: Re: [PATCH 4/6] drivers/acpi: Use kasprintf
Message-Id: <20100318162529.762251ef.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1003102216290.1672@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1003102216290.1672@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 10 Mar 2010 22:16:51 +0100 (CET)
Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> kasprintf combines kmalloc and sprintf, and takes care of the size
> calculation itself.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression a,flag;
> expression list args;
> statement S;
> @@
> 
>   a > -  \(kmalloc\|kzalloc\)(...,flag)
> +  kasprintf(flag,args)
>   <... when != a
>   if (a = NULL || ...) S
>   ...>
> - sprintf(a,args);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/acpi/video.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff -u -p a/drivers/acpi/video.c b/drivers/acpi/video.c
> --- a/drivers/acpi/video.c
> +++ b/drivers/acpi/video.c
> @@ -1005,11 +1005,10 @@ static void acpi_video_device_find_cap(s
>  		result = acpi_video_init_brightness(device);
>  		if (result)
>  			return;
> -		name = kzalloc(MAX_NAME_LEN, GFP_KERNEL);
> +		name = kasprintf(GFP_KERNEL, "acpi_video%d", count++);
>  		if (!name)
>  			return;
>  
> -		sprintf(name, "acpi_video%d", count++);
>  		device->backlight = backlight_device_register(name,
>  			NULL, device, &acpi_backlight_ops);
>  		kfree(name);
> @@ -1056,10 +1055,9 @@ static void acpi_video_device_find_cap(s
>  		if (device->cap._DCS && device->cap._DSS) {
>  			static int count;
>  			char *name;
> -			name = kzalloc(MAX_NAME_LEN, GFP_KERNEL);
> +			name = kasprintf(GFP_KERNEL, "acpi_video%d", count++);
>  			if (!name)
>  				return;
> -			sprintf(name, "acpi_video%d", count++);
>  			device->output_dev = video_output_register(name,
>  					NULL, device, &acpi_output_properties);
>  			kfree(name);

It's not an equivalent change - if the memory allocation fails, this
patch will now cause `count' to be incremented anyway, presumably
leaving a gap in the enumeration.

I don't know if that matters.  If so, this:

--- a/drivers/acpi/video.c~drivers-acpi-use-kasprintf-fix
+++ a/drivers/acpi/video.c
@@ -1006,9 +1006,10 @@ static void acpi_video_device_find_cap(s
 		result = acpi_video_init_brightness(device);
 		if (result)
 			return;
-		name = kasprintf(GFP_KERNEL, "acpi_video%d", count++);
+		name = kasprintf(GFP_KERNEL, "acpi_video%d", count);
 		if (!name)
 			return;
+		count++;
 
 		memset(&props, 0, sizeof(struct backlight_properties));
 		props.max_brightness = device->brightness->count - 3;
@@ -1058,9 +1059,10 @@ static void acpi_video_device_find_cap(s
 		if (device->cap._DCS && device->cap._DSS) {
 			static int count;
 			char *name;
-			name = kasprintf(GFP_KERNEL, "acpi_video%d", count++);
+			name = kasprintf(GFP_KERNEL, "acpi_video%d", count);
 			if (!name)
 				return;
+			count++;
 			device->output_dev = video_output_register(name,
 					NULL, device, &acpi_output_properties);
 			kfree(name);
_

