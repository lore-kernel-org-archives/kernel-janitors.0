From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Tue, 11 Apr 2017 08:09:02 +0000
Subject: Re: [patch] mtd: nand: Fix a couple error codes
Message-Id: <20170411100902.072b812f@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170404081545.GA25533@mwanda>
 <20170409163322.3da06acd@bbrezillon> <20170410070943.GA4366@mwanda>
In-Reply-To: <20170410070943.GA4366@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

On Mon, 10 Apr 2017 10:09:43 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Sun, Apr 09, 2017 at 04:33:22PM +0200, Boris Brezillon wrote:
> > Hi Dan,
> > 
> > On Tue, 4 Apr 2017 11:15:46 +0300
> > Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >   
> > > We accidentally return 1 on error instead of proper error codes.  
> > 
> > These bugs have not reached Linus' tree yet and I'll have to force push
> > my nand/next branch because of regressions introduced by other patches
> > (not related to the Atmel NAND driver rework). Do you mind if I squash
> > the changes in the original commit?
> >   
> 
> No problem.  I'm lobying for a Fixes-from: tag for this, (which would
> not cover style issues), but it's not an official tag yet.

Never mind. Another bug as been reported/fixed in the same driver, so
I'll just pick your patch as is instead of merging the changes in the
initial commit.

Thanks,

Boris
