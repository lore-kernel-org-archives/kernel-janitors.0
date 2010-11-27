From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 27 Nov 2010 08:20:49 +0000
Subject: Re: [patch] WMI: return error if wmi_create_device() fails
Message-Id: <20101127082049.GF28667@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101125173552.GB12939@bicker>
In-Reply-To: <20101125173552.GB12939@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 25, 2010 at 08:35:52PM +0300, Dan Carpenter wrote:
> The break resets the retval to 0 but we want to return an error code.
> This was introduced in c64eefd48c4 "WMI: embed struct device directly
> into wmi_block"
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Oops, thanks for finding it.

Acked-by: Dmitry Torokhov <dtor@mail.ru>


> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 104b77c..a5b7a4d 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -812,7 +812,7 @@ static acpi_status parse_wdg(acpi_handle handle)
>  		if (IS_ERR(wblock)) {
>  			retval = PTR_ERR(wblock);
>  			wmi_free_devices();
> -			break;
> +			goto out_free_pointer;
>  		}
>  
>  		if (debug_event) {

-- 
Dmitry
