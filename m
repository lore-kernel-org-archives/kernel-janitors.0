From: Mel Gorman <mgorman@suse.de>
Date: Fri, 27 Jul 2012 14:53:03 +0000
Subject: Re: [next:akpm 147/308] net/sunrpc/clnt.c:720:36: sparse: dereference of noderef expression
Message-Id: <20120727145303.GF612@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120727130225.GA29912@localhost>
In-Reply-To: <20120727130225.GA29912@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 27, 2012 at 10:27:32PM +0800, Fengguang Wu wrote:
> On Fri, Jul 27, 2012 at 03:10:36PM +0100, Mel Gorman wrote:
> > On Fri, Jul 27, 2012 at 09:02:25PM +0800, Fengguang Wu wrote:
> > > Hi Mel,
> > > 
> > > There are new sparse warnings show up in
> > > 
> > > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> > > head:   247109fa112ac912f31efc28e130ed2a0cc1764c
> > > commit: 5bb176c86a868289d5d93d89919c3b5a339d6d20 [147/308] nfs: enable swap on NFS
> > > 
> > 
> > Thanks (adding Andrew to cc for picking up in mm)
> > 
> > How about the following?
> 
> Looks good to me. And it does fix the warning.
> 
> I assume the fix will be folded into the original patch, otherwise the
> subject will look a bit strange ;)
> 

That's what I'm expecting. I've sent a few fixes marked "buildfix:
patch subject" so Andrew knows exactly which patches to fold together.
Ordinarily when dealing with just mmotm I would specify the filename in
the quilt series but that does not make as much sense when talking about
linux-next.

-- 
Mel Gorman
SUSE Labs
