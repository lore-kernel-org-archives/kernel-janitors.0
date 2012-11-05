From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 05 Nov 2012 16:26:29 +0000
Subject: Re: [PATCH] drivers/misc/kgdbts.c: remove eprintk
Message-Id: <201211051626.29317.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr> <201211042051.58473.arnd@arndb.de> <alpine.DEB.2.02.1211042202240.1960@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1211042202240.1960@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: walter harms <wharms@bfs.de>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Sunday 04 November 2012, Julia Lawall wrote:
> >
> > I don't see yet where that KERN_WARNING gets added. Looking at
> > warn_slowpath_common, there are two or three lines that get printed at
> > KERN_WARNING level, followed by the format that got passed into WARN(),
> > which may or may not include a printk level, but I don't see one getting
> > added.
> 
> OK, I agree.  There are lots of KERN_WARNINGs, but not on the string that 
> was passed in.  Still, maybe it is not so good to pass a KERN_XXX for some 
> other XXX to WARN.

Given that most users don't pass anything here, and that those that do pass
something are somewhat inconsistent, could we make the messages always get
printed at KERN_WARNING level from WARN(), and kill off the instances
that already pass a level?

	Arnd
