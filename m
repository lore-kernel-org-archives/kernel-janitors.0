From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Dec 2012 02:42:49 +0000
Subject: Re: build regressions 2012-12-16
Message-Id: <20121219024249.GB12000@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50ce25f5.HSy7oO1Xg2rjXytA%fengguang.wu@intel.com>
In-Reply-To: <50ce25f5.HSy7oO1Xg2rjXytA%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Dec 17, 2012 at 12:54:39AM +0300, Dan Carpenter wrote:
> On Mon, Dec 17, 2012 at 03:50:13AM +0800, Fengguang Wu wrote:
> > [smatch]
> > drivers/staging/bcm/CmHost.c:1274 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (8255). (psfCSType->cCPacketClassificationRule.u8ProtocolDestPortRange s32min-s32max)
> > drivers/staging/bcm/CmHost.c:1274 DumpCmControlPacket() Function too hairy.  Giving up.
> > drivers/staging/comedi/drivers/ni_mio_cs.c:452 mio_cs_attach() info: why not propagate 'ret' from request_irq() instead of (-22)?
> > drivers/staging/bcm/CmHost.c:1242 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (5597). (psfCSType 4096-(-1),4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-(-1),4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-(-1),4096-s64max,4096-s64max,4096-s64max,4096-(-1),4096-s64max,4096-(-1),4096-s64max,)
> > drivers/video/omap2/dss/dsi.c:1386 dsi_pll_calc_clock_div_pck() debug: sval_binop_unsigned: divide by zero
> > drivers/video/omap2/dss/dsi.c:1486 dsi_pll_calc_ddrfreq() debug: sval_binop_unsigned: divide by zero
> 
> I see that you have upgraded to the new version.  :)

Yes, after some delay. :)

> Some of the error messages were already there before but the format
> changed slightly.  Sorry about that.

No problem.

> There are a bunch of debug statements here.  Ignore them unless they
> lead to a false positive.  Warnings and errors will all have "warn:"
> or "error:" in the message.  I've removed the "debug: could not get
> condition type" warning.

OK, I'll completely ignore all smatch debug messages from now on.

> These also weren't sent to the kbuild list so I guess you already
> you looked at them manually.

Yes.

Thanks,
Fengguang
