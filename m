From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 09 Apr 2013 08:08:33 +0000
Subject: Re: [patch] reset: NULL deref on allocation failure
Message-Id: <1365494913.4023.23.camel@pizza.hi.pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130403050253.GA31179@longonot.mountain>
In-Reply-To: <20130403050253.GA31179@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Donnerstag, den 04.04.2013, 15:13 +0300 schrieb Dan Carpenter:
> On Thu, Apr 04, 2013 at 07:56:50PM +0800, Shawn Guo wrote:
> > I think you should take care of the patch to have it merged through the
> > same path that the 'reset API' series goes to mainline.
> > 
> 
> That's fine by me as well.

Ok, I've added the patch on top of the branch
git://git.pengutronix.de/git/pza/linux.git reset/for_v3.10
for Olof to pull.

regards
Philipp

