From: Martin Olsen <triplefault@gmail.com>
Date: Wed, 10 Jan 2007 13:31:43 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <200701101431.43362.triplefault@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 10 January 2007 13:12, you wrote:
> Martin Olsen wrote:
> > What do you say to this patch?
> >
> > Martin
>
> Circular inclusion protection or multiple inclusion protection at least?
>
> > ------------------------------------------------------------------------
> >
> > diff -uprN -X linux-2.6.19-vanilla/Documentation/dontdiff
> > linux-2.6.19-vanilla/include/linux/power_of_2.h
> > linux-2.6.19-changed/include/linux/power_of_2.h ---
> > linux-2.6.19-vanilla/include/linux/power_of_2.h	1970-01-01
> > 01:00:00.000000000 +0100 +++
> > linux-2.6.19-changed/include/linux/power_of_2.h	2007-01-10
> > 12:42:03.000000000 +0100 @@ -0,0 +1,20 @@
>
> #ifndef _LINUX_POWER_OF_2_H
> #define _LINUX_POWER_OF_2_H
>
> > +static inline bool is_power_of_2(int i)
> > +{
> > +	return i > 0 && (i & (i - 1)) = 0;
> > +}
>
> /* perhaps rather - to be able to get those cases
>    where 0 is acceptable as well? */
> static inline bool is_power_of_2_or_zero(int i)
> {
>         return (i & (i - 1)) = 0;
> }
>
> static inline bool is_power_of_2(int i)
> {
>         return i && is_power_of_2_or_zero(i);
> }
>
> > +static inline int round_up_to_power_of_2(int i)
> > +{
> > +	while ((i & (i - 1)) != 0)
> > +		i += i & ~(i - 1);
> > +
> > +	return i;
> > +}
> > +
> > +static inline int round_down_to_power_of_2(int i)
> > +{
> > +	while (i & (i - 1))
> > +		i &= (i - 1);
> > +
> > +	return i;
> > +}
>
> #endif

Done.

Should I add a license/copyright notice at the top of the file?

Martin
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
