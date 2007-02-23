From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Fri, 23 Feb 2007 08:56:37 +0000
Subject: Re: [KJ] [RFC][PATCH] BIT macro cleanup
Message-Id: <45DEAC45.7090105@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b44d3fb0702222056k1d2a9b57q69a3555a09a9058e@mail.gmail.com> <3b44d3fb0702230014x4ee4a1dewdc624c54b3635e15@mail.gmail.com>
In-Reply-To: <3b44d3fb0702230014x4ee4a1dewdc624c54b3635e15@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Choudhary <milindchoudhary@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, linux-input@atrey.karlin.mff.cuni.cz, linux-joystick@atrey.karlin.mff.cuni.cz

Milind Choudhary wrote:
> Hi all
>     working towards the cleanup of BIT macro,
> I've added one to <linux/bitops.h> & cleaned some obvious users.
>
> include/linux/input.h also has a BIT macro
> which does a wrap
> so currently i've done something like
>
> +#undef BIT
> #define BIT(nr)        (1UL << ((nr) % BITS_PER_LONG))
>
> Is it advisible to move this macro to bitops.h with some other name
>
> +#define BITWRAP(nr)    (1UL << ((nr) % BITS_PER_LONG))
>
> & make the whole input subsystem use it
> The change is huge, more than 125 files using input.h
> & almost all use the BIT macro.
It is as a big of change, but have you dismissed the "BIT(nr % 
BITS_PER_LONG)" approach?
I really think this has to be broken down into a patch-set.

<snip>
> diff --git a/fs/select.c b/fs/select.c
> index fe0893a..4bbe8ed 100644
> --- a/fs/select.c
> +++ b/fs/select.c
> @@ -180,7 +180,6 @@ get_max:
>        return max;
> }
>
> -#define BIT(i)         (1UL << ((i)&(__NFDBITS-1)))
Are you sure you can just delete this one?

<snip>
> diff --git a/include/linux/input.h b/include/linux/input.h
> index bde65c8..e4203d1 100644
> --- a/include/linux/input.h
> +++ b/include/linux/input.h
> @@ -908,9 +908,11 @@ struct ff_effect {
> #include <linux/fs.h>
> #include <linux/timer.h>
> #include <linux/mod_devicetable.h>
> +//#include <linux/bitops.h>
You added and commented it out?
>
> #define NBITS(x) (((x)/BITS_PER_LONG)+1)
> -#define BIT(x) (1UL<<((x)%BITS_PER_LONG))
> +#undef BIT
> +#define BIT(nr)        (1UL << ((nr) % BITS_PER_LONG))
Why did you change x to nr? The other defines seems to use x.
> #define LONG(x) ((x)/BITS_PER_LONG)
>
> #define INPUT_KEYCODE(dev, scancode) ((dev->keycodesize = 1) ?
> ((u8*)dev->keycode)[scancode] : \
> diff --git a/include/video/sstfb.h b/include/video/sstfb.h
> index baa163f..b52f073 100644
> --- a/include/video/sstfb.h
> +++ b/include/video/sstfb.h
> @@ -68,7 +68,6 @@
> #  define print_var(X,Y...)
> #endif
>
> -#define BIT(x)         (1ul<<(x))
> #define POW2(x)                (1ul<<(x))
Maybe you can clean up POW2 as well (or define it as "#define POW2(x) 
BIT(x)")

Also, it seems your mail-client swapped the tabs to spaces (aka not able 
to apply).

Other then what I have commented on, it looks good.

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
