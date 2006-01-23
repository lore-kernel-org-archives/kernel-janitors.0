From: Andi Kleen <ak@suse.de>
Date: Mon, 23 Jan 2006 04:52:08 +0000
Subject: [KJ] Re: Fixing make mandocs
Message-Id: <200601230552.09142.ak@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601230531.27609.ak@suse.de> <20060122204921.613349e5.rdunlap@xenotime.net>
In-Reply-To: <20060122204921.613349e5.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Monday 23 January 2006 05:49, Randy.Dunlap wrote:
> On Mon, 23 Jan 2006 05:31:27 +0100 Andi Kleen wrote:
> 
> > 
> > Here would be a good janitor task for 2.6.16. make mandocs currently
> > doesn't build because a number of descriptions are missing parameters etc.
> > It would be good if someone could fix that and submit patches for 2.6.16.
> > 
> > It should be relatively straight forward, if one cannot figure out
> > what a missing parameter does adding a dummy description ("Undocumented") 
> > would be also ok.
> > 
> > -Andi
> 
> Lots of these have been fixed in the last 2-3 days by Martin Waitz
> and/or me and have been posted on lkml.  Martin is collecting them
> in his kernel-doc tree.

Ok good. Are they going into 2.6.16?

-Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
