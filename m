From: Mattia Dongili <malattia@linux.it>
Date: Sun, 27 Feb 2011 12:20:27 +0000
Subject: Re: [patch 4/4] sony-laptop: potential null dereference
Message-Id: <20110227122027.GD29319@kamineko.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110226125611.GL18043@bicker>
In-Reply-To: <20110226125611.GL18043@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Feb 26, 2011 at 03:56:11PM +0300, Dan Carpenter wrote:
> In the original code, if "device_enum" was NULL then it would
> dereference it when it printed the error message.

Yup, this and the others are actual bugs, thanks for reviewing the code.

> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 0db9049..c24aa4a 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -1311,7 +1311,11 @@ static void sony_nc_rfkill_setup(struct acpi_device *device)
>  	}
>  
>  	device_enum = (union acpi_object *) buffer.pointer;
> -	if (!device_enum || device_enum->type != ACPI_TYPE_BUFFER) {
> +	if (!device_enum) {
> +		pr_err(DRV_PFX "Invalid SN06 return object.");

Just a nitpick but I'd say there was no return object at all. ;)

-- 
mattia
:wq!
