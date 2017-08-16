From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 16 Aug 2017 16:13:27 +0000
Subject: Re: [PATCH] thunderbolt: fix incorrect value assigned to req->response_type
Message-Id: <20170816161327.GB3550@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170815143133.26500-1-colin.king@canonical.com>
 <20170815143834.GL2369@lahna.fi.intel.com>
 <20170815152259.idjvtw5tdg24xj2o@mwanda>
 <20170816081001.GP2369@lahna.fi.intel.com>
In-Reply-To: <20170816081001.GP2369@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Colin King <colin.king@canonical.com>, Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 16, 2017 at 11:10:01AM +0300, Mika Westerberg wrote:
> On Tue, Aug 15, 2017 at 06:22:59PM +0300, Dan Carpenter wrote:
> > On Tue, Aug 15, 2017 at 05:38:34PM +0300, Mika Westerberg wrote:
> > > On Tue, Aug 15, 2017 at 03:31:33PM +0100, Colin King wrote:
> > > > From: Colin Ian King <colin.king@canonical.com>
> > > > 
> > > > req->response_type is being assigned the sizeof TB_CFG_PKG_RESET
> > > > and should actually be assigned TB_CFG_PKG_RESET. Fix this.
> > > > 
> > > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > 
> > > IIRC I already acked this some time ago ;-)
> > > 
> > > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > 
> > > BTW, you should CC Greg as he has been gathering Thunderbolt related
> > > patches. I added him now.
> > 
> > Yeah.  I sent this patch on Jun 14.  "[PATCH] thunderbolt: Fix reset
> > response_type"  I didn't CC Greg, either.  Someone should probably
> > update MAINTAINERS if Greg needs to get these emails.
> 
> Indeed.
> 
> Greg, Andreas,
> 
> Should we add Greg to the MAINTAINERS so that he will be getting all the
> thunderbolt related patches? Another way, if we want to make this easier
> for Greg, is to establish a thunderbolt tree in kernel.org and send pull
> requests to him directly.

The "maintainers" of thunderbolt should either be forwarding on patches
to me to accept, or to give me a git tree to pull, or to ack patches
that I am cc:ed on.  Whichever works best for them, but in all cases, I
am not the maintainer of the thunderbolt subsystem, so I don't need to
be listed under MAINTAINERS.

thanks,

greg k-h
