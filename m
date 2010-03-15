From: Ralf Baechle <ralf@linux-mips.org>
Date: Mon, 15 Mar 2010 17:49:05 +0000
Subject: Re: [PATCH 1/3] arch/mips/txx9/generic: init dynamic bin_attribute
Message-Id: <20100315174905.GC20055@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1268377431-11671-1-git-send-email-w.sang@pengutronix.de>
 <1268377431-11671-2-git-send-email-w.sang@pengutronix.de>
 <20100312183450.GC8736@core.coreip.homeip.net>
 <20100313022855.GD4034@pengutronix.de>
In-Reply-To: <20100313022855.GD4034@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, kernel-janitors@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

On Sat, Mar 13, 2010 at 03:28:55AM +0100, Wolfram Sang wrote:

> > Regarding all 3 - it looks like these dynamically alocated attributes
> > could be converted to statically allocated ones. I'd recommend doing
> > that instead (in fact, I posted patch for the firmware_class couple days
> > ago).
> 
> I agree for the firmware-patch. Regarding the MIPS one, 'size' might differ and
> 'private' will differ per instance. Regarding the RTC driver, 'size' might also
> differ. I don't know if somebody really wants two RTCs or the SRAM for MIPS can
> be instantiated more than once. Unless somebody with actual hardware jumps in,
> I'd say better safe than sorry.

On the txx9 platform you've posted the patch for additional RTCs or SRAMs
would not normally be expected.  On other platforms such as IP27 there
would be one per node that is potencially very many.

  Ralf
