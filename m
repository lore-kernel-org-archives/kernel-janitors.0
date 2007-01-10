From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 10 Jan 2007 15:40:04 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <Pine.LNX.4.64.0701101029160.9117@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 10 Jan 2007, Martin Olsen wrote:

> Using "unsigned long" certainly seems more sane than int.
>
> I've split the code up in is_power_of_2{,_or_zero} functions, changed "int"
> to "unsigned long" and added the circular inclusion protection.
>
> ---
>
> diff -uprN -X linux-2.6.19-vanilla/Documentation/dontdiff
> linux-2.6.19-vanilla/include/linux/power_of_2.h
> linux-2.6.19-changed/include/linux/power_of_2.h
> --- linux-2.6.19-vanilla/include/linux/power_of_2.h	1970-01-01
> 01:00:00.000000000 +0100
> +++ linux-2.6.19-changed/include/linux/power_of_2.h	2007-01-10
> 16:05:28.000000000 +0100
> @@ -0,0 +1,30 @@
> +#ifndef _LINUX_POWER_OF_2_H
> +#define _LINUX_POWER_OF_2_H
> +
> +static inline bool is_power_of_2_or_zero(unsigned long i)
> +{
> +	return (i & (i - 1)) = 0;
> +}
> +
> +static inline bool is_power_of_2(unsigned long i)
> +{
> +	return i && is_power_of_2_or_zero(i);
> +}
> +
> +static inline unsigned long round_up_to_power_of_2(unsigned long i)
> +{
> +	while ((i & (i - 1)) != 0)
> +		i += i & ~(i - 1);
> +
> +	return i;
> +}
> +
> +static inline unsigned long round_down_to_power_of_2(unsigned long i)
> +{
> +	while (i & (i - 1))
> +		i &= (i - 1);
> +
> +	return i;
> +}
> +
> +#endif /* !_LINUX_POWER_OF_2_H */
             ^^^^^^^^^^^^^^^^^^^^  i think that might be overkill.  at
most, the existing header files rarely add the "!".

looks reasonably sane, i don't see any immediate problems.  i'm still
interested if there's a single (bitwise?) operation to do the rounding
up or down without involving a loop, which would be cool, but i don't
know if that's possible.  anyone?

at this point, i would submit this as an official patch to the KJ
list.  um ... you *have* tested this code to see what it does in
various situations, right?  :-)

rday

p.s.  don't forget to add the copyright/license stuff at the top.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
