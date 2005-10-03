From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 03 Oct 2005 05:59:26 +0000
Subject: Re: [KJ] [PATCH 2.6.13.2 1/1] acpi: kmalloc failure handling
Message-Id: <20051003055926.GA737@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67648710466050943=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051003040021.GA25808@poopie.dyndns.org>
In-Reply-To: <20051003040021.GA25808@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============67648710466050943==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 02, 2005 at 11:00:21PM -0500, irwan.djajadi@iname.com wrote:
> --- 2.6/drivers/acpi/hotkey.c
> +++ mod1-2.6/drivers/acpi/hotkey.c
> @@ -719,6 +719,8 @@ get_parms(char *config_record,

>  	*action_handle = (char *) kmalloc(count+1, GFP_KERNEL);
> +	if (!*action_handle)
> +		goto do_fail;

Applied. Meanwhile, can you switch get_parms() from "Return 6 on
success. Return -1 on error and caller should take care of cleanup."?

> --- 2.6/drivers/acpi/osl.c
> +++ mod1-2.6/drivers/acpi/osl.c
> @@ -755,6 +755,10 @@ acpi_os_create_lock (

>  	lock_ptr = acpi_os_allocate(sizeof(spinlock_t));
> +	if (!lock_ptr) {
> +		ACPI_DEBUG_PRINT ((ACPI_DB_ERROR, "Failed to allocate spinlock.\n"));

Just return -ENOME^WAE_NO_MEMORY.

> +		return_ACPI_STATUS (AE_NO_MEMORY);


--===============67648710466050943==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67648710466050943==--
