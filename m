From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 06 Oct 2012 01:07:44 +0000
Subject: Re: drivers/net/cris/eth_v10.c:1715:2: error: too many arguments to function 'e100rxtx_interrupt'
Message-Id: <20121006010744.GA7525@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928130608.GA5158@localhost>
 <20121003104652.GK1390@axis.com>
 <20121003.144040.1719867946304137902.davem@davemloft.net>
 <20121003202656.GT1390@axis.com>
 <20121005212422.GA1390@axis.com>
In-Reply-To: <20121005212422.GA1390@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: David Miller <davem@davemloft.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Fri, Oct 05, 2012 at 11:24:22PM +0200, Jesper Nilsson wrote:
> On Wed, Oct 03, 2012 at 10:26:57PM +0200, Jesper Nilsson wrote:
> > On Wed, Oct 03, 2012 at 08:40:40PM +0200, David Miller wrote:
> > > From: Jesper Nilsson <jesper.nilsson@axis.com>
> > > Date: Wed, 3 Oct 2012 12:46:52 +0200
> > > 
> > > > On Fri, Sep 28, 2012 at 03:06:08PM +0200, Fengguang Wu wrote:
> > > >> Hi Jesper,
> > > > 
> > > > Hi!
> > > > 
> > > >> FYI, a rather old build bug that's introduced by
> > > >> 
> > > >> bafef0a cris build fixes: update eth_v10.c ethernet driver
> > > >> 
> > > >> All error/warnings:
> > > >> 
> > > >> drivers/net/cris/eth_v10.c: In function 'e100_netpoll':
> > > >> drivers/net/cris/eth_v10.c:1715:2: error: too many arguments to function 'e100rxtx_interrupt'
> > > >> drivers/net/cris/eth_v10.c:1131:1: note: declared here
> > > > 
> > > > Yep, I can't figure out why the followup patches never reached mainline,
> > > > but we have fixes for exactly that in our in-house tree.
> > > > I'll push some move patches after this merge window.
> > > 
> > > It's a bug fix, even worse a build fix, why want until after the merge
> > > window?
> > 
> > Aye, true, I'll just have to make sure I don't get any other change from
> > the inhouse tree.
> 
> Turns out this was already fixed in mainline since August.

Embarrassing.. It must be testing some git tree that's based on one
upstream HEAD sometime between where the bug was introduced and where
it's fixed.

Thanks,
Fengguang
