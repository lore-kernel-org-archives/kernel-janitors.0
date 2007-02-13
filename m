From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Tue, 13 Feb 2007 09:04:38 +0000
Subject: Re: [KJ] anyone interested in the "power of 2" stuff?
Message-Id: <1171356758.11581.17.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702081713530.5222@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0702081713530.5222@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I have a doubt:
There are instances as follows:

/* ASIC location registers should be 0 or have only a single bit set. */
    if (   (iobase_reg  & (iobase_reg - 1))

here and in other similar situations the variables values vary from 0
and above
In such checks the above might be more optimized...as the is_power_of_2
will
1. check for 0 and fail that
2. check for even and pass it
3. or if it is odd...fail it

op 1 would be done followed by op 2/3

The code would be like
if(!iobase_reg && !is_power_of_2(iobase_reg))
---where we are checking for 0 at 2 places-both inside and outside of
is_power_of_2

But the n & (n-1) is just one step.
Is this not more optimised?

What would you suggest here?

On Fri, 2007-02-09 at 07:39 -0500, Robert P. J. Day wrote:
> On Fri, 9 Feb 2007, Vignesh Babu BM wrote:
> 
> >
> > On Thu, 2007-02-08 at 17:17 -0500, Robert P. J. Day wrote:
> >
> > > http://fsdev.net/wiki/index.php?title=Power_of_2_stuff
> > >
> > >   any takers?
> > >
> > > rday
> > >
> >
> > I would take that up rday.
> 
> ok, have at it, and keep us up to date on the wiki page.
> 
> rday
> 
> p.s.  note that we still haven't formalized the rounding stuff so, as
> i mention in the wiki page, the only changes should involve *just*
> strict power of 2 testing, and not as part of a larger bit of code
> that's trying to round, or anything like that.
> 
-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
