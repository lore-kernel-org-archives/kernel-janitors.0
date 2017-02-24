From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Fri, 24 Feb 2017 21:38:38 +0000
Subject: Re: [PATCH] staging: bcm2835: Fix a memory leak in error handling path
Message-Id: <398315856.259038.1487972318815@email.1und1.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219103412.10092-1-christophe.jaillet@wanadoo.fr>
 <6585ca42-71f4-1517-c6fc-b9ed2f23c687@i2se.com>
 <20170224195731.GB4480@mwanda>
In-Reply-To: <20170224195731.GB4480@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org


> Dan Carpenter <dan.carpenter@oracle.com> hat am 24. Februar 2017 um 20:57 geschrieben:
> 
> 
> On Fri, Feb 24, 2017 at 01:37:30PM +0100, Stefan Wahren wrote:
> > Hi Christophe,
> > 
> > Am 19.02.2017 um 11:34 schrieb Christophe JAILLET:
> > >If 'kzalloc()' fails, we should release resources allocated so far, just as
> > >done in all other cases in this function.
> > >
> > >Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > >---
> > >Not sure that the error handling path is correct.
> > >Is 'gdev[0]' freed? Should it be?
> > 
> 
> Yes, but I already sent a patch to fix this and your leak as well and
> Greg merged it.

My leak? I'm confused.
