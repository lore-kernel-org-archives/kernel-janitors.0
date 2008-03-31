From: Adrian Bunk <bunk@kernel.org>
Date: Mon, 31 Mar 2008 17:53:57 +0000
Subject: Re: [PATCH] Remove empty function from arch/arm/mach-pxa/trizeps4.c
Message-Id: <20080331175357.GA23259@cs181133002.pp.htv.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200803311803.19734.dron@infosec.ru>
In-Reply-To: <200803311803.19734.dron@infosec.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Mar 31, 2008 at 06:03:19PM +0400, Andrey Valyaev wrote:
> Remove empty function from arch/arm/mach-pxa/trizeps4.c
> It's valid Janitor patch?

Does anyone call pxaohci_platform_data->exit unconditionally assuming it 
is always present?

>  trizeps4.c |    6 ------
>  1 file changed, 6 deletions(-)
> 
> ========
> diff --git a/arch/arm/mach-pxa/trizeps4.c b/arch/arm/mach-pxa/trizeps4.c
> index f207fcd..5df658f 100644
> --- a/arch/arm/mach-pxa/trizeps4.c
> +++ b/arch/arm/mach-pxa/trizeps4.c
> @@ -333,15 +333,9 @@ static int trizeps4_ohci_init(struct device *dev)
>         return 0;
>  }
> 
> -static void trizeps4_ohci_exit(struct device *dev)
> -{
> -       ;
> -}
> -
>  static struct pxaohci_platform_data trizeps4_ohci_platform_data = {
>         .port_mode      = PMM_PERPORT_MODE,
>         .init           = trizeps4_ohci_init,
> -       .exit           = trizeps4_ohci_exit,
>  };
> 
>  static struct map_desc trizeps4_io_desc[] __initdata = {
> ========
> 
> -- 
> 
> 	Andrey Valyaev <dron@infosec.ru>

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

