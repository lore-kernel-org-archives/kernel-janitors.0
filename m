From: Mattia Dongili <malattia@linux.it>
Date: Sun, 27 Feb 2011 12:12:59 +0000
Subject: Re: [patch 1/4] sony-laptop: make a couple variables static
Message-Id: <20110227121259.GB29319@kamineko.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110226125427.GI18043@bicker>
In-Reply-To: <20110226125427.GI18043@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Feb 26, 2011 at 03:54:27PM +0300, Dan Carpenter wrote:
> Sparse complains that these variables should be static.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Mattia Dongili <malattia@linux.it>

> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index a0ba0e7..a7b9c72 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -745,7 +745,7 @@ struct sony_nc_handles {
>  	struct device_attribute devattr;
>  };
>  
> -struct sony_nc_handles *handles;
> +static struct sony_nc_handles *handles;
>  
>  static ssize_t sony_nc_handles_show(struct device *dev,
>  		struct device_attribute *attr, char *buffer)
> @@ -1358,7 +1358,7 @@ struct kbd_backlight {
>  	struct device_attribute timeout_attr;
>  };
>  
> -struct kbd_backlight *kbdbl_handle;
> +static struct kbd_backlight *kbdbl_handle;
>  
>  static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
>  {
-- 
mattia
:wq!
