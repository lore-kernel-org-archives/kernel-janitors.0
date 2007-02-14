From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 14 Feb 2007 19:35:24 +0000
Subject: Re: [KJ] [PATCH] Marking obsolete-deprecated stuff
Message-Id: <20070214193524.GF17598@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1264e020702140722x511bc01ajc6ccbd4eb2816f05@mail.gmail.com>
In-Reply-To: <d1264e020702140722x511bc01ajc6ccbd4eb2816f05@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2007-02-14 at 18:32:00 +0100, yaman <yamanc@gmail.com> wrote:
> Sorry about the re-send, non-attached version :)
> For marking obsolete-deprecated stuff, compiles fine for arm. If
> that's the way to go i can complete the rest.

Unfortunately your patch got line-wrapped

> Signed-off-by: Yaman Cakmakci <yamanc@gmail.com <mailto:yamanc@gmail.com>>

Just the email without mailto: will do here.

> diff -uprN -X linux-2.6.20-vanilla/Documentation/dontdiff 
> linux-2.6.20-vanilla/arch/arm/kernel/compat.c 
> linux-2.6.20/arch/arm/kernel/compat.c
> --- linux-2.6.20-vanilla/arch/arm/kernel/compat.c    2006-09-20 
> 06:42:06.000000000 +0300
> +++ linux-2.6.20/arch/arm/kernel/compat.c    2007-02-14 
> 15:43:03.000000000 +0200
> @@ -38,8 +38,9 @@
>   *    guaranteed to contain useful data in setup_arch()
>   *
>   * This is the old deprecated way to pass parameters to the kernel
> + * Should've been obsoleted by now, as it's 2007 now

Nitpicking: Two times 'now' in the same sentence. Might need some
readjustment ;)

>   */
> -struct param_struct {
> +struct __deprecated param_struct {
>      union {
>      struct {
>          unsigned long page_size;        /*  0 */
> diff -uprN -X linux-2.6.20-vanilla/Documentation/dontdiff 
> linux-2.6.20-vanilla/arch/arm/mm/mmu.c linux-2.6.20/arch/arm/mm/mmu.c
> --- linux-2.6.20-vanilla/arch/arm/mm/mmu.c    2007-02-14 
> 15:12:18.000000000 +0200
> +++ linux-2.6.20/arch/arm/mm/mmu.c    2007-02-14 15:49:33.000000000 +0200
> @@ -117,18 +117,16 @@ static void __init early_cachepolicy(cha
>  }
>  __early_param("cachepolicy=", early_cachepolicy);
>  
> -static void __init early_nocache(char **__unused)
> +__deprecated static void __init early_nocache(char **__unused)

Storage class should always be first.

>  {
>      char *p = "buffered";
> -    printk(KERN_WARNING "nocache is deprecated; use cachepolicy=%s\n", p);
>      early_cachepolicy(&p);
>  }
>  __early_param("nocache", early_nocache);
>  
> -static void __init early_nowrite(char **__unused)
> +__deprecated static void __init early_nowrite(char **__unused)

Ditto.

>  {
>      char *p = "uncached";
> -    printk(KERN_WARNING "nowb is deprecated; use cachepolicy=%s\n", p);
>      early_cachepolicy(&p);
>  }
>  __early_param("nowb", early_nowrite);
> diff -uprN -X linux-2.6.20-vanilla/Documentation/dontdiff 
> linux-2.6.20-vanilla/arch/arm26/kernel/compat.c 
> linux-2.6.20/arch/arm26/kernel/compat.c
> --- linux-2.6.20-vanilla/arch/arm26/kernel/compat.c    2006-09-20 
> 06:42:06.000000000 +0300
> +++ linux-2.6.20/arch/arm26/kernel/compat.c    2007-02-14 
> 15:52:30.000000000 +0200
> @@ -38,8 +38,9 @@
>   *    guaranteed to contain useful data in setup_arch()
>   *
>   * This is the old deprecated way to pass parameters to the kernel
> + * Should've been obsoleted by now, as it's 2007 now

Same as above.

>   */
> -struct param_struct {
> +struct __deprecated param_struct {
>      union {
>      struct {
>          unsigned long page_size;        /*  0 */
> diff -uprN -X linux-2.6.20-vanilla/Documentation/dontdiff 
> linux-2.6.20-vanilla/arch/arm26/kernel/setup.c 
> linux-2.6.20/arch/arm26/kernel/setup.c
> --- linux-2.6.20-vanilla/arch/arm26/kernel/setup.c    2007-02-14 
> 15:04:16.000000000 +0200
> +++ linux-2.6.20/arch/arm26/kernel/setup.c    2007-02-14 
> 15:56:57.000000000 +0200
> @@ -354,9 +354,8 @@ static int __init parse_tag_ramdisk(cons
>  
>  __tagtable(ATAG_RAMDISK, parse_tag_ramdisk);
>  
> -static int __init parse_tag_initrd(const struct tag *tag)
> +__deprecated static int __init parse_tag_initrd(const struct tag *tag)

Storage class again.

>  {
> -    printk(KERN_WARNING "ATAG_INITRD is deprecated; please update your 
> bootloader. \n");
>          phys_initrd_start = (unsigned long)tag->u.initrd.start;
>          phys_initrd_size = (unsigned long)tag->u.initrd.size;
>      return 0;
> @@ -364,9 +363,8 @@ static int __init parse_tag_initrd(const
>  
>  __tagtable(ATAG_INITRD, parse_tag_initrd);
>  
> -static int __init parse_tag_initrd2(const struct tag *tag)
> +__deprecated static int __init parse_tag_initrd2(const struct tag *tag)

And yet again.

Cheers, Tobias
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
