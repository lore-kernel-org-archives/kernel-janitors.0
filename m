From: Randy Dunlap <rdunlap@xenotime.net>
Date: Sun, 10 Feb 2008 22:14:28 +0000
Subject: Re: more cleanup -- using FIELD_SIZEOF() macro
Message-Id: <20080210141428.bf93165d.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0802100637001.9465@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0802100637001.9465@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 10 Feb 2008 21:56:38 +0100 (CET) Julia Lawall wrote:

> On Sun, 10 Feb 2008, Robert P. J. Day wrote:
> 
> > 
> >   the header file include/linux/kernel.h defines:
> > 
> >   #define FIELD_SIZEOF(t, f) (sizeof(((t*)0)->f))
> > 
> > which is a much more pleasant way of calculating the size of a
> > structure member.  and there's plenty of places in the tree where that
> > change can be made, which you can see if you search for the
> > appropriate pattern:
> > 
> > $ grep -Er "sizeof ?\( ?\( ?\([^\*]*[^ ] ?\*\) ?0 ?\)->[^\)]+\)" *
> 
> What about these (also in kernel.h)?
> 
> #define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
> #define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))

What about them?  What is your question?

---
~Randy
