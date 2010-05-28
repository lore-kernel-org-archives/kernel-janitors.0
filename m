From: Joerg Roedel <joro@8bytes.org>
Date: Fri, 28 May 2010 09:15:20 +0000
Subject: Re: [PATCH 0/4] Add a Coccinelle front-end script
Message-Id: <20100528091520.GL1237@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273508667-5152-1-git-send-email-npalix@diku.dk> <20100528070921.GK1237@8bytes.org> <20100528072504.GB3344@pengutronix.de> <Pine.LNX.4.64.1005280931230.9138@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005280931230.9138@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Nicolas Palix <npalix@diku.dk>, Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Kernel Janitors <kernel-janitors@vger.kernel.org>

On Fri, May 28, 2010 at 09:31:34AM +0200, Julia Lawall wrote:
> On Fri, 28 May 2010, Wolfram Sang wrote:
> 
> > > Don't know how complex the coccinelle software itself is, but I think it
> > > would make sense to ship it with the kernel-sources too. That together
> > 
> > You can easily find out by browsing the homepage of coccinelle.
> 
> Over 100 000 lines of code.

I just noticed that distributions already ship it in their repositories.
So this its okay to keep it outside the kernel sources.

	Joerg

