From: "=?ISO-8859-1?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@helsinki.fi>
Date: Sun, 03 Aug 2008 12:30:24 +0000
Subject: Re: [PATCH] Remove warning 'unused variable battery' in drivers/acpi/sbs.c
Message-Id: <Pine.LNX.4.64.0808031528420.31606@wrl-59.cs.helsinki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30808030024v18912201x46d12fe389e508f8@mail.gmail.com>
In-Reply-To: <ea11fea30808030024v18912201x46d12fe389e508f8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, astarikovskiy@suse.de, vladimir.p.lebedev@intel.com, LKML <linux-kernel@vger.kernel.org>, trivial@vger.kernel.org

On Sun, 3 Aug 2008, Manish Katiyar wrote:

> Below patch removes the following warning:
> drivers/acpi/sbs.c: In function 'acpi_battery_remove':
> drivers/acpi/sbs.c:819: warning: unused variable 'battery'
> 
> 
> 
> Signed-off-by:- "Manish Katiyar" <mkatiyar@gmail.com>
> 
> ---
>  drivers/acpi/sbs.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
> index 10a3651..8493603 100644
> --- a/drivers/acpi/sbs.c
> +++ b/drivers/acpi/sbs.c
> @@ -816,7 +816,9 @@ static int acpi_battery_add(struct acpi_sbs *sbs, int id)
> 
>  static void acpi_battery_remove(struct acpi_sbs *sbs, int id)
>  {
> +#ifdef CONFIG_ACPI_SYSFS_POWER || CONFIG_ACPI_PROCFS_POWER

I don't think you can use || operator in ifdef like that... ...Try
#if defined(...) || (...) instead.


-- 
 i.
