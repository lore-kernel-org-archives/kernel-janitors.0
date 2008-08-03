From: "=?ISO-8859-1?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@helsinki.fi>
Date: Sun, 03 Aug 2008 14:43:26 +0000
Subject: Re: [PATCH] resend: Remove warning 'unused variable battery' in
Message-Id: <Pine.LNX.4.64.0808031739080.31690@wrl-59.cs.helsinki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30808030612m7ab72e85xf34e290d674d955d@mail.gmail.com>
In-Reply-To: <ea11fea30808030612m7ab72e85xf34e290d674d955d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, astarikovskiy@suse.de, LKML <linux-kernel@vger.kernel.org>, trivial@kernel.org

On Sun, 3 Aug 2008, Manish Katiyar wrote:

> Resend of the patch to remove the following warning:
> drivers/acpi/sbs.c: In function 'acpi_battery_remove':
> drivers/acpi/sbs.c:819: warning: unused variable 'battery'
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
> +#if defined (CONFIG_ACPI_SYSFS_POWER) || (CONFIG_ACPI_PROCFS_POWER)

Sorry, my bad this time, you actually need to have defined() around both 
of the config symbols though I forgot it in one of them in my example 
because I was using dots instead of real ones that would have made that 
mistake obvious due to capitalization.

> >> +#ifdef CONFIG_ACPI_SYSFS_POWER || CONFIG_ACPI_PROCFS_POWER
> >
> > I don't think you can use || operator in ifdef like that... ...Try
> > #if defined(...) || (...) instead.


-- 
 i.
