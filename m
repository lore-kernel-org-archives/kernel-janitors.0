From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 26 Apr 2007 12:57:34 +0000
Subject: Re: [KJ] centralizing arch-specific kernel config settings
Message-Id: <Pine.LNX.4.64.0704260854400.2157@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0704260706100.533@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0704260706100.533@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 26 Apr 2007, Matthew Wilcox wrote:

> On Thu, Apr 26, 2007 at 07:06:56AM -0400, Robert P. J. Day wrote:
> > in all of the above cases, the Kconfig directive looks like:
> >
> > ...
> > config GENERIC_BUG
> >         bool
> >         default y
> >         depends on BUG
> > ...
>
> It should proably use def_bool y instead of bool, default y.

i agree, but there's a bazillion of the slightly longer form, and i
doubt it's worth trying to change them over (unless someone wants to
take that on as a KJ project and do it an architecture at a time).

> >   is there any reason config settings like GENERIC_BUG can't be
> > centralized in a single place like that?  i'm *guessing* a pile of
> > config settings could be simplified like this.
>
> Is it simpler?

it's definitely shorter, but i'm guessing it's probably *conceptually*
easier for each architecture to look after its own "generic" settings,
even if it's more verbose.  so never mind, it was just a thought.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
