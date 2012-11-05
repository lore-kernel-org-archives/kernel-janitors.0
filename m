From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 05 Nov 2012 20:01:49 +0000
Subject: Re: [PATCH] drivers/misc/kgdbts.c: remove eprintk
Message-Id: <201211052001.49672.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr> <201211051626.29317.arnd@arndb.de> <alpine.DEB.2.02.1211051754080.1973@hadrien>
In-Reply-To: <alpine.DEB.2.02.1211051754080.1973@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: walter harms <wharms@bfs.de>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Monday 05 November 2012, Julia Lawall wrote:
> OK, I could try proposing that, and if someone doesn't think it is the
> right thing to do, they can ignore the patch.
> 
> Concretely, KERN_WARNING should be added in the printk called from WARN,
> and all KERN information should be removed from the calls?

I think that would be the right solution, yes. Unfortunately, I don't
know how to easily do this since we are already passing down a format
string into vprintk here. Maybe just add the KERN_WARNING at the point
where __WARN_printf gets called.

	Arnd
