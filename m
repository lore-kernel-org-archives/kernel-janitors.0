From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 10 Feb 2008 23:54:14 +0000
Subject: Re: more cleanup -- using FIELD_SIZEOF() macro
Message-Id: <alpine.LFD.1.00.0802101851170.16389@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0802100637001.9465@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0802100637001.9465@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 10 Feb 2008, Julia Lawall wrote:

> On Sun, 10 Feb 2008, Randy Dunlap wrote:
>
> > On Sun, 10 Feb 2008 21:56:38 +0100 (CET) Julia Lawall wrote:
> >
> > > On Sun, 10 Feb 2008, Robert P. J. Day wrote:
> > >
> > > >
> > > >   the header file include/linux/kernel.h defines:
> > > >
> > > >   #define FIELD_SIZEOF(t, f) (sizeof(((t*)0)->f))
> > > >
> > > > which is a much more pleasant way of calculating the size of a
> > > > structure member.  and there's plenty of places in the tree where that
> > > > change can be made, which you can see if you search for the
> > > > appropriate pattern:
> > > >
> > > > $ grep -Er "sizeof ?\( ?\( ?\([^\*]*[^ ] ?\*\) ?0 ?\)->[^\)]+\)" *
> > >
> > > What about these (also in kernel.h)?
> > >
> > > #define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
> > > #define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))
> >
> > What about them?  What is your question?
>
> Sorry for not being more clear.  The original suggestion was to
> replace occurrences of a macro by a call to the macro itself.
> These two macros are defined on the two lines after the definition
> of FIELD_SIZEOF.  There are many occurrences of expressions of the
> form (((n) + (d) - 1) / (d)) and ((((x) + ((y) - 1)) / (y)) * (y)),
> so I was wondering if it would be interesting to replace them as
> well.

stuff like that is simply an ongoing chore -- if you see potential
simplifications, submit a patch.

having said that, i have to confess that i *despise* those two roundup
macro definitions.  surely there could have been a more consistent
design for those.  gack.  barf.

rday

p.s.  what i would like to see is a breakout of some of the content of
kernel.h into smaller, more targeted header files.  it's pretty silly
for the kernel source tree to have a header file named "kernel.h".
i'd think it would make *far* more sense to have smaller,
kernel-specific headers like stdint.h, align.h and so on.

p.p.s.  another obvious cleanup is, given the macros in kernel.h, to
peruse the source tree and remove the numerous redefinitions of those
same macros.

--
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

Home page:                                         http://crashcourse.ca
Fedora Cookbook:    http://crashcourse.ca/wiki/index.php/Fedora_Cookbook
====================================
