From: Julia Lawall <julia@diku.dk>
Date: Sun, 10 Feb 2008 22:22:22 +0000
Subject: Re: more cleanup -- using FIELD_SIZEOF() macro
Message-Id: <Pine.LNX.4.64.0802102318550.23906@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0802100637001.9465@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0802100637001.9465@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 10 Feb 2008, Randy Dunlap wrote:

> On Sun, 10 Feb 2008 21:56:38 +0100 (CET) Julia Lawall wrote:
> 
> > On Sun, 10 Feb 2008, Robert P. J. Day wrote:
> > 
> > > 
> > >   the header file include/linux/kernel.h defines:
> > > 
> > >   #define FIELD_SIZEOF(t, f) (sizeof(((t*)0)->f))
> > > 
> > > which is a much more pleasant way of calculating the size of a
> > > structure member.  and there's plenty of places in the tree where that
> > > change can be made, which you can see if you search for the
> > > appropriate pattern:
> > > 
> > > $ grep -Er "sizeof ?\( ?\( ?\([^\*]*[^ ] ?\*\) ?0 ?\)->[^\)]+\)" *
> > 
> > What about these (also in kernel.h)?
> > 
> > #define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
> > #define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))
> 
> What about them?  What is your question?

Sorry for not being more clear.  The original suggestion was to replace 
occurrences of a macro by a call to the macro itself.  These two macros 
are defined on the two lines after the definition of FIELD_SIZEOF.  There 
are many occurrences of expressions of the form (((n) + (d) - 1) / (d)) 
and ((((x) + ((y) - 1)) / (y)) * (y)), so I was wondering if it would be 
interesting to replace them as well.

julia

