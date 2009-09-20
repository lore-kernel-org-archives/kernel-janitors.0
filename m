From: Julia Lawall <julia@diku.dk>
Date: Sun, 20 Sep 2009 05:21:36 +0000
Subject: Re: exported symbols
Message-Id: <Pine.LNX.4.64.0909200719430.13416@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909182336590.4238@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0909182336590.4238@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 19 Sep 2009, Greg KH wrote:

> On Fri, Sep 18, 2009 at 11:39:34PM +0200, Julia Lawall wrote:
> > Functions that are exported using EXPORT_SYMBOL, and thus are presumably 
> > freely available for use in dynamically loaded modules, do not seem to 
> > very often check the validity of their inputs.  For a simple example, 
> > the following code from arch/arm/mach-realview/clock.c does not even check 
> > that clk is not NULL:
> > 
> >  unsigned long clk_get_rate(struct clk *clk)
> >  {
> >         return clk->rate;
> >  }
> >  EXPORT_SYMBOL(clk_get_rate);
> > 
> > Is this a problem?
> 
> No, as long as all callers are not passing NULL :)
> 
> Seriously, it's not an issue, putting error checking for everything
> causes a lot of extra code for no reason, as we can easily audit all
> callers of these symbols, it is not always necessary to check the
> paramters.

Who is we?  If the symbol is exported can't anyone write a kernel module 
that uses the function?  Is the policy that in that case they get what 
they deserve?

julia
