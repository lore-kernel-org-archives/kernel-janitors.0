From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Wed, 16 Aug 2017 08:10:01 +0000
Subject: Re: [PATCH] thunderbolt: fix incorrect value assigned to req->response_type
Message-Id: <20170816081001.GP2369@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170815143133.26500-1-colin.king@canonical.com>
 <20170815143834.GL2369@lahna.fi.intel.com>
 <20170815152259.idjvtw5tdg24xj2o@mwanda>
In-Reply-To: <20170815152259.idjvtw5tdg24xj2o@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin King <colin.king@canonical.com>, Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Tue, Aug 15, 2017 at 06:22:59PM +0300, Dan Carpenter wrote:
> On Tue, Aug 15, 2017 at 05:38:34PM +0300, Mika Westerberg wrote:
> > On Tue, Aug 15, 2017 at 03:31:33PM +0100, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > req->response_type is being assigned the sizeof TB_CFG_PKG_RESET
> > > and should actually be assigned TB_CFG_PKG_RESET. Fix this.
> > > 
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > 
> > IIRC I already acked this some time ago ;-)
> > 
> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > 
> > BTW, you should CC Greg as he has been gathering Thunderbolt related
> > patches. I added him now.
> 
> Yeah.  I sent this patch on Jun 14.  "[PATCH] thunderbolt: Fix reset
> response_type"  I didn't CC Greg, either.  Someone should probably
> update MAINTAINERS if Greg needs to get these emails.

Indeed.

Greg, Andreas,

Should we add Greg to the MAINTAINERS so that he will be getting all the
thunderbolt related patches? Another way, if we want to make this easier
for Greg, is to establish a thunderbolt tree in kernel.org and send pull
requests to him directly.

Please let me know your preference.
