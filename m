From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 10 Jan 2007 18:04:34 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <Pine.LNX.4.64.0701101259350.9846@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 10 Jan 2007, Martin Olsen wrote:

> A quick search on Google Code found this snippet:
>
> /* rounding macros, assumes ALIGN is a power of two */
> #define ROUND_UP(N,ALIGN)       (((N) + ((ALIGN)-1)) & ~((ALIGN)-1))
> #define ROUND_DOWN(N,ALIGN)     ((N) & ~((ALIGN)-1))
>
> I am no mathematician, but wouldn't the above code work if ALIGN was
> set to 2?

but that would only round up/down to the next *multiple* of two, not
*power* of two.  big difference.

> > at this point, i would submit this as an official patch to the KJ
> > list.  um ... you *have* tested this code to see what it does in
> > various situations, right?  :-)
>
> Heh.. No, I forgot that. A quick testcase compiled against my header
> file correctly denies any knowledge of "bool" (not defined in C).
> Should I include linux/types.h or just use "_Bool" (is _Bool part of
> C? I cant find any definitions of it in my include directories)?

if you want to use "bool" in kernel space, you should include
<linux/types.h>, which has the line:

  typedef _Bool                   bool;

that should be sufficient.  add that "include" line to your
power_of_2.h header file.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
