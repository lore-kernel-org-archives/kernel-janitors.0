From: "vignesh babu" <vigneshbabu@gmail.com>
Date: Wed, 05 Sep 2007 09:07:05 +0000
Subject: Re: [PATCH] Add macro to round down to nearest power of two.
Message-Id: <3d1754a30709050155k367f9a36j482229e5e9a61d8d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0708270907270.929@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0708270907270.929@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Resending this...as I did not get the mail thru KJ...

Robert,

 Maybe its late, but I would still like to discuss if it is
needed-is_power_of_2 has '2' and not 'two' which I think is easier to
work with. I was hoping that the 2 macros that you have coded can also
be named with a '2' in them than a 'two'.

There have been many changes that went in already based on these 2
macros.I have the cleanup patches ready(for log2.h AND all the changes
that went in), but my net at home went down, should be up in a few
hours and so i should be able to mail in the cleanups in a few hours.

If you and others feel that the 'two's can be replaced with '2' then I
would push in the patches by tonight.

Vignesh Babu.

On 8/27/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
> Consistent with the existing roundup_pow_of_two() routine, add the
> corresponding rounddown_pow_of_two() routine.
>
> Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>
>
> ---
>
>   i'm not sure if this has already been accepted into one of the
> preliminary trees, but can someone check that the logic here makes
> sense?  i've tested it, and it seems to return the correct results.
>
>   and this would certainly allow some existing code to be simplified.
>
>
> diff --git a/include/linux/log2.h b/include/linux/log2.h
> index 1b8a2c1..ff8835b 100644
> --- a/include/linux/log2.h
> +++ b/include/linux/log2.h
> @@ -63,6 +63,15 @@ unsigned long __roundup_pow_of_two(unsigned long n)
>         return 1UL << fls_long(n - 1);
>  }
>
> +/*
> + * round down to nearest power of two
> + */
> +static inline __attribute__((const))
> +unsigned long __rounddown_pow_of_two(unsigned long n)
> +{
> +       return 1UL << (fls_long(n) - 1);
> +}
> +
>  /**
>   * ilog2 - log of base 2 of 32-bit or a 64-bit unsigned value
>   * @n - parameter
> @@ -165,4 +174,20 @@ unsigned long __roundup_pow_of_two(unsigned long n)
>         __roundup_pow_of_two(n)                 \
>   )
>
> +/**
> + * rounddown_pow_of_two - round the given value down to nearest power of two
> + * @n - parameter
> + *
> + * round the given value down to the nearest power of two
> + * - the result is undefined when n = 0
> + * - this can be used to initialise global variables from constant data
> + */
> +#define rounddown_pow_of_two(n)                        \
> +(                                              \
> +       __builtin_constant_p(n) ? (             \
> +               (n = 1) ? 0 :                  \
> +               (1UL << ilog2(n)) :             \
> +       __rounddown_pow_of_two(n)               \
> + )
> +
>  #endif /* _LINUX_LOG2_H */
>
> rday
> --
> ====================================
> Robert P. J. Day
> Linux Consulting, Training and Annoying Kernel Pedantry
> Waterloo, Ontario, CANADA
>
> http://crashcourse.ca
> ====================================
> -
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 

----------------------------------------------
"Why is it that every time I'm with you, makes me believe in magic?"
