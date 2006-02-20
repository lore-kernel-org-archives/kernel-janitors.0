From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Feb 2006 23:13:16 +0000
Subject: Re: [KJ][Patch] remove checks of u32 < 0 in processor_core.c
Message-Id: <20060220231316.GJ29791@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95796422256395108=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140441306.7787.24.camel@localhost.localdomain>
In-Reply-To: <1140441306.7787.24.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============95796422256395108==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2006 at 12:15:06AM +1100, Darren Jenkins" wrote:
> ICC warns about :Pointless comparison of unsigned integer with zero
> @ lines 552, 742, 782, 788 of processor_core.c
>
> In all four cases this is because of checking if a member "u32 id" of
> "struct acpi_processor" is negative.
> As id is u32 the patch below removes the checks for negative values.

This is controversial. At least crypto people like such checks because
if later someone will turn a variable into signed one, no new bugs will
be introduced. And compiler can optimize away "unsigned int a < 0".
Silently or not - that's the question.

To shift you attention away, why do we sometimes BUG, sometimes silently
return success?

> --- linux-2.6.16-rc3/drivers/acpi/processor_core.c.orig
> +++ linux-2.6.16-rc3/drivers/acpi/processor_core.c
> @@ -549,7 +549,7 @@ static int acpi_processor_start(struct a
>  		return_VALUE(0);
>  	}
>
> -	BUG_ON((pr->id >= NR_CPUS) || (pr->id < 0));
> +	BUG_ON(pr->id >= NR_CPUS);
>
>  	/*
>  	 * Buggy BIOS check
> @@ -739,7 +739,7 @@ int acpi_processor_device_add(acpi_handl
>  	if (!pr)
>  		return_VALUE(-ENODEV);
>
> -	if ((pr->id >= 0) && (pr->id < NR_CPUS)) {
> +	if (pr->id < NR_CPUS) {
>  		kobject_uevent(&(*device)->kobj, KOBJ_ONLINE);
>  	}
>  	return_VALUE(0);
> @@ -779,13 +779,13 @@ acpi_processor_hotplug_notify(acpi_handl
>  			break;
>  		}
>
> -		if (pr->id >= 0 && (pr->id < NR_CPUS)) {
> +		if (pr->id < NR_CPUS) {
>  			kobject_uevent(&device->kobj, KOBJ_OFFLINE);
>  			break;
>  		}
>
>  		result = acpi_processor_start(device);
> -		if ((!result) && ((pr->id >= 0) && (pr->id < NR_CPUS))) {
> +		if (!result && pr->id < NR_CPUS) {
>  			kobject_uevent(&device->kobj, KOBJ_ONLINE);
>  		} else {
>  			ACPI_DEBUG_PRINT((ACPI_DB_ERROR,


--===============95796422256395108==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95796422256395108==--
