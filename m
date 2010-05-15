From: Alexey Starikovskiy <astarikovskiy@suse.de>
Date: Sat, 15 May 2010 21:33:28 +0000
Subject: Re: [PATCH 11/37] drivers/acpi: Use kmemdup
Message-Id: <4BEF1328.8040306@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005152316030.21345@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005152316030.21345@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Julia,

Acked-by: Alexey Starikovskiy <astarikovskiy@suse.de>

Thanks,
Alex.


16.05.2010 01:16, Julia Lawall пишет:
> From: Julia Lawall<julia@diku.dk>
>
> Use kmemdup when some other buffer is immediately copied into the
> allocated region.
>
> A simplified version of the semantic patch that makes this change is as
> follows: (http://coccinelle.lip6.fr/)
>
> //<smpl>
> @@
> expression from,to,size,flag;
> statement S;
> @@
>
> -  to = \(kmalloc\|kzalloc\)(size,flag);
> +  to = kmemdup(from,size,flag);
>     if (to=NULL || ...) S
> -  memcpy(to, from, size);
> //</smpl>
>
> Signed-off-by: Julia Lawall<julia@diku.dk>
>
> ---
>   drivers/acpi/ec.c |    3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff -u -p a/drivers/acpi/ec.c b/drivers/acpi/ec.c
> --- a/drivers/acpi/ec.c
> +++ b/drivers/acpi/ec.c
> @@ -1027,10 +1027,9 @@ int __init acpi_ec_ecdt_probe(void)
>   		/* Don't trust ECDT, which comes from ASUSTek */
>   		if (!EC_FLAGS_VALIDATE_ECDT)
>   			goto install;
> -		saved_ec = kmalloc(sizeof(struct acpi_ec), GFP_KERNEL);
> +		saved_ec = kmemdup(boot_ec, sizeof(struct acpi_ec), GFP_KERNEL);
>   		if (!saved_ec)
>   			return -ENOMEM;
> -		memcpy(saved_ec, boot_ec, sizeof(struct acpi_ec));
>   	/* fall through */
>   	}
>

