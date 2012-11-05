From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 05 Nov 2012 16:57:42 +0000
Subject: Re: [PATCH] drivers/misc/kgdbts.c: remove eprintk
Message-Id: <alpine.DEB.2.02.1211051754080.1973@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr> <201211042051.58473.arnd@arndb.de> <alpine.DEB.2.02.1211042202240.1960@localhost6.localdomain6> <201211051626.29317.arnd@arndb.de>
In-Reply-To: <201211051626.29317.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Julia Lawall <julia.lawall@lip6.fr>, walter harms <wharms@bfs.de>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Mon, 5 Nov 2012, Arnd Bergmann wrote:

> On Sunday 04 November 2012, Julia Lawall wrote:
> > >
> > > I don't see yet where that KERN_WARNING gets added. Looking at
> > > warn_slowpath_common, there are two or three lines that get printed at
> > > KERN_WARNING level, followed by the format that got passed into WARN(),
> > > which may or may not include a printk level, but I don't see one getting
> > > added.
> >
> > OK, I agree.  There are lots of KERN_WARNINGs, but not on the string that
> > was passed in.  Still, maybe it is not so good to pass a KERN_XXX for some
> > other XXX to WARN.
>
> Given that most users don't pass anything here, and that those that do pass
> something are somewhat inconsistent, could we make the messages always get
> printed at KERN_WARNING level from WARN(), and kill off the instances
> that already pass a level?

OK, I could try proposing that, and if someone doesn't think it is the
right thing to do, they can ignore the patch.

Concretely, KERN_WARNING should be added in the printk called from WARN,
and all KERN information should be removed from the calls?

thanks,
julia
