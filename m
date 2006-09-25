From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 25 Sep 2006 14:09:19 +0000
Subject: Re: [KJ] [PATCH] ioremap balance with iounmap for drivers/net
Message-Id: <20060925070919.bbffaf8b.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158931552.25016.9.camel@amol.verismonetworks.com>
In-Reply-To: <1158931552.25016.9.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 25 Sep 2006 01:44:08 -0400 Jeff Garzik wrote:

> Amol Lad wrote:
> >> 1) linux-net is a *user* list. you should have mailed netdev@...
> > Thanks.. I'll post it to net-dev
> > 
> >> 2) e1000 already contains that change. Did you base your work on jgarzik's 
> >> upstream tree?
> > I used latest 2.6.18
> 
> That's not sufficient.  Tons of changes occur between releases.  You 
> need to use the latest tree.  Since netdev#upstream went to Linus today, 
> the latest is in linux-2.6.git.
> 
> 
> >> 3) your patch includes utsrelease.h!
> > This was discussed sometime back on this list, I believe. The file
> > should be included in dontdiff but due to som reason it's not there...I
> > never touch this file but still it's always there in the patch...
> 
> To put it bluntly, we don't care why it's there.  Make sure it isn't in 
> the next time.

and it's now included in the dontdiff file if you use the latest
git tree or patch.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
