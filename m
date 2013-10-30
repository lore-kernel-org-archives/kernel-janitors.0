From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Wed, 30 Oct 2013 11:29:31 +0000
Subject: Re: [PATCH 0/14] JANITOR: Remove include/linux/sys.h
Message-Id: <20131030112931.GD26766@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131029095347.GA12832@nbf-011.seri.co.uk>
In-Reply-To: <20131029095347.GA12832@nbf-011.seri.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 30, 2013 at 11:03:57AM +0000, Julia Lawall wrote:
> On Wed, 30 Oct 2013, Mika Kukkonen wrote:
> 
> > On Tue, Oct 29, 2013 at 01:36:09PM +0000, Dan Carpenter wrote:
> > >
> > > Kernel Janitors doesn't have an a patch tree.  In theory these could all
> > > go through trivial@kernel.org or they could go to the subsystem
> > > maintainers.  You pretty much have broken it up by subsystem already.
> >
> > Yes, but I chickened out and did not want to CC 14 subsystem maintainers. ;-)
> 
> I've deleted the mail with the patches, but if it would be useful for the
> maintainers to see the patches, you should send them to them.  That is,
> send each patch to the people indicated by get_maintainers.

Yeah, I'll probably do that, but I got bunch other janitorial stuff(*) in pipeline,
so I will probably delay this to next merge window as this is in no way urgent.

--MiKu

(*) Basically I am trying to make "make W=1" usefull, I just happened to stumble
    upon this <linux/sys.h> while working on that.

