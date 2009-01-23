From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 23 Jan 2009 15:31:41 +0000
Subject: Re: [PATCH] Add missing ifdef in x86 setup.c
Message-Id: <80b317760901230731k631fa96fw899489aed2c88a35@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090122130427.GA15214@milesteg.arr>
In-Reply-To: <20090122130427.GA15214@milesteg.arr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2009/1/22 Daniele Venzano <venza@brownhat.org>:
> The following patch removes a warning generated when the x86
> architecture is compitled without CONFIG_X86_RESERVE_LOW_64K.
> The warning was: 'dmi_low_memory_corruption' defined but not used
>
> Patch is against 2.6.28.1
>
> Signed-off-by: Daniele Venzano <venza@brownhat.org>
>
> --- a/arch/x86/kernel/setup.c   2009-01-22 13:57:16.000000000 +0100
> +++ b/arch/x86/kernel/setup.c   2009-01-22 13:57:39.000000000 +0100
> @@ -738,6 +738,7 @@ void start_periodic_check_for_corruption
>  }
>  #endif
>
> +#ifdef CONFIG_X86_RESERVE_LOW_64K
>  static int __init dmi_low_memory_corruption(const struct dmi_system_id *d)
>  {
>        printk(KERN_NOTICE
> @@ -749,6 +750,7 @@ static int __init dmi_low_memory_corrupt
>
>        return 0;
>  }
> +#endif
>
>  /* List of systems that have known low memory corruption BIOS problems */
>  static struct dmi_system_id __initdata bad_bios_dmi_table[] = {
>
this patch is already in mainline (commit
bb5574608a8375026510b4f983ffbb06ece33fe2 )

my advice, instead of working on 2.6.28.1, try to work on linus' git :
<git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git>

if you are not yet comfortable with git, there's an howto :
<http://linux.yyz.us/git-howto.html>

richard
