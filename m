From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 04 Nov 2012 20:51:58 +0000
Subject: Re: [PATCH] drivers/misc/kgdbts.c: remove eprintk
Message-Id: <201211042051.58473.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr> <201211041939.51608.arnd@arndb.de> <alpine.DEB.2.02.1211042051190.1960@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1211042051190.1960@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: walter harms <wharms@bfs.de>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Sunday 04 November 2012, Julia Lawall wrote:

> > Hmm, I did not think that WARN() took a KERN_ERR argument, which should
> > really be implied here. Looking at the code, it really seems to be required
> > at the moment, but only 5 out of 117 callers use it this way.
> >
> > Any idea what is going on here?
> 
> I'm not sure to understand the 5 and 117.  Using grep, I get 30 with 
> KERN_ERR, 61 with some KERN thing, and 1207 without KERN. 

Right, I was using 'grep -w', which misses a lot of the instances, although
I see still much fewer in the last category.

> If things are 
> set up such that warn_slowpath_fmt is called, then that function adds
> KERN_WARNING.  There is an alternate definition of __WARN_printf that just 
> does a printk.

I don't see yet where that KERN_WARNING gets added. Looking at
warn_slowpath_common, there are two or three lines that get printed at 
KERN_WARNING level, followed by the format that got passed into WARN(),
which may or may not include a printk level, but I don't see one getting
added.


	Arnd
