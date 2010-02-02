From: Alexey Starikovskiy <astarikovskiy@suse.de>
Date: Tue, 02 Feb 2010 15:35:44 +0000
Subject: Re: [PATCH] drivers/acpi/ec.c fix a small memory leak
Message-Id: <4B684650.9070807@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1265112730.4804.8.camel@ICE-BOX>
In-Reply-To: <1265112730.4804.8.camel@ICE-BOX>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Len Brown <lenb@kernel.org>, linux ACPI <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

NAK

saved_ec is allocated if flag EC_FLAGS_VALIDATE_ECDT is true.
EC_FLAGS_SKIP_DSDT_SCAN have no sense in such case, thus this new code path
is never executed.
On the other hand, unconditionally freeing pointer, which is might be NULL, is not
right either.
So, this patch introduced more problems as it tries to solve...

Regards,
Alex.

Darren Jenkins пишет:
> Plug a very small leak in acpi_ec_ecdt_probe()
> 
> Coverity CID: 13319
> 
> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com> 
> 
> diff --git drivers/acpi/ec.c drivers/acpi/ec.c
> index d6471bb..13061dc 100644
> --- drivers/acpi/ec.c
> +++ drivers/acpi/ec.c
> @@ -1009,8 +1009,10 @@ int __init acpi_ec_ecdt_probe(void)
>  	/* fall through */
>  	}
>  
> -	if (EC_FLAGS_SKIP_DSDT_SCAN)
> +	if (EC_FLAGS_SKIP_DSDT_SCAN) {
> +		kfree(saved_ec);
>  		return -ENODEV;
> +	}
>  
>  	/* This workaround is needed only on some broken machines,
>  	 * which require early EC, but fail to provide ECDT */
> 
> 

