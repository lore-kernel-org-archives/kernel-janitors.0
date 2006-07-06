From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Thu, 06 Jul 2006 01:34:28 +0000
Subject: Re: [KJ] [PATCH] drivers/atm/nicstar.c: add KERN_* to printk
Message-Id: <20060705183428.e3e8b876.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44ABCCD6.6060101@chello.nl>
In-Reply-To: <44ABCCD6.6060101@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 06 Jul 2006 05:44:43 +0200 Richard wrote:

> Randy.Dunlap wrote:
> > On Thu, 06 Jul 2006 04:56:44 +0200 Richard wrote:
> > 
> >> Add KERN_*  to printk statements.
> >>
> >> Signed-off-by: Richard van Berkum <h.vanberkum at chello.nl>
> > 
> > The content looks good to me, but I'm just scanning over them.
> > 
> > This one does not apply cleanly for me:
> > 
> > patch: **** malformed patch at line 30: structure.\n", i);
> > 
> > Something split one source line into 2 lines for you.  :(
> > 
> > Fixing that one finds another one (about 15-20 or so total bad line
> > splits).
> > 
> > It also doesn't apply cleanly to 2.6.17-git24 for me.  Maybe
> > it applies to 2.6.17-git25?  (always send patches against a
> > current linus-mainline tree)
> 
> That's this tree: rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/git.git
> right? Or should I download the one from kernel.org?

Your choice.   You can use git to download the current git tree
or you can use the daily snapshots (tarballs) and apply them manually
or automagically, e.g., with 'ketchup' (www.selenic.com/ketchup/)
or grab-kernel-rc (script) from www.xenotime.net/linux/scripts/ . 

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
