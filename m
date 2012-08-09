From: "Rafael J. Wysocki" <rjw@sisk.pl>
Date: Thu, 09 Aug 2012 21:13:09 +0000
Subject: Re: [pm:linux-next 25/39] arch/arm/mach-shmobile/pm-r8a7779.c:203:2: warning: (near initialization f
Message-Id: <201208092313.09527.rjw@sisk.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120809173158.GB14562@localhost>
In-Reply-To: <20120809173158.GB14562@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Thursday, August 09, 2012, Fengguang Wu wrote:
> Hi Rafael,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> head:   d456facb656659ead41e1b3cccf693213e80d04a
> commit: 85b6dd851494d40ae48895454f836b21d07758cc [25/39] ARM: shmobile: Drop r8a7779_add_device_to_domain()
> config: arm-marzen_defconfig (attached as .config)
> 
> All error/warnings:
> 
> arch/arm/mach-shmobile/pm-r8a7779.c:203:2: error: unknown field 'genpd_name' specified in initializer
> arch/arm/mach-shmobile/pm-r8a7779.c:203:2: warning: missing braces around initializer [-Wmissing-braces]
> arch/arm/mach-shmobile/pm-r8a7779.c:203:2: warning: (near initialization for 'r8a7779_sh4a.genpd') [-Wmissing-braces]
> arch/arm/mach-shmobile/pm-r8a7779.c:203:2: warning: initialization from incompatible pointer type [enabled by default]
> arch/arm/mach-shmobile/pm-r8a7779.c:203:2: warning: (near initialization for 'r8a7779_sh4a.genpd.domain.ops.prepare') [enabled by default]
> arch/arm/mach-shmobile/pm-r8a7779.c:211:2: error: unknown field 'genpd_name' specified in initializer
> arch/arm/mach-shmobile/pm-r8a7779.c:211:2: warning: missing braces around initializer [-Wmissing-braces]
> arch/arm/mach-shmobile/pm-r8a7779.c:211:2: warning: (near initialization for 'r8a7779_sgx.genpd') [-Wmissing-braces]
> arch/arm/mach-shmobile/pm-r8a7779.c:211:2: warning: initialization from incompatible pointer type [enabled by default]
> arch/arm/mach-shmobile/pm-r8a7779.c:211:2: warning: (near initialization for 'r8a7779_sgx.genpd.domain.ops.prepare') [enabled by default]
> arch/arm/mach-shmobile/pm-r8a7779.c:219:2: error: unknown field 'genpd_name' specified in initializer
> arch/arm/mach-shmobile/pm-r8a7779.c:219:2: warning: missing braces around initializer [-Wmissing-braces]
> arch/arm/mach-shmobile/pm-r8a7779.c:219:2: warning: (near initialization for 'r8a7779_vdp1.genpd') [-Wmissing-braces]
> arch/arm/mach-shmobile/pm-r8a7779.c:219:2: warning: initialization from incompatible pointer type [enabled by default]
> arch/arm/mach-shmobile/pm-r8a7779.c:219:2: warning: (near initialization for 'r8a7779_vdp1.genpd.domain.ops.prepare') [enabled by default]
> arch/arm/mach-shmobile/pm-r8a7779.c:227:2: error: unknown field 'genpd_name' specified in initializer
> arch/arm/mach-shmobile/pm-r8a7779.c:227:2: warning: missing braces around initializer [-Wmissing-braces]
> arch/arm/mach-shmobile/pm-r8a7779.c:227:2: warning: (near initialization for 'r8a7779_impx3.genpd') [-Wmissing-braces]
> arch/arm/mach-shmobile/pm-r8a7779.c:227:2: warning: initialization from incompatible pointer type [enabled by default]
> arch/arm/mach-shmobile/pm-r8a7779.c:227:2: warning: (near initialization for 'r8a7779_impx3.genpd.domain.ops.prepare') [enabled by default]
> 
> vim +203 arch/arm/mach-shmobile/pm-r8a7779.c
>    200	}
>    201	
>    202	struct r8a7779_pm_domain r8a7779_sh4a = {
>  > 203		.genpd_name = "SH4A",
>    204		.ch = {
>    205			.chan_offs = 0x80, /* PWRSR1 .. PWRER1 */
>    206			.isr_bit = 16, /* SH4A */
> 

Thanks for the report!

This problem should be fixed in linux-pm/linux-next now.

Thanks,
Rafael
