From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 13 Mar 2010 08:33:59 +0000
Subject: Re: [PATCH 1/3] arch/mips/txx9/generic: init dynamic bin_attribute
Message-Id: <20100313083359.GB22494@core.coreip.homeip.net>
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
Cc: kernel-janitors@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

On Sat, Mar 13, 2010 at 03:28:55AM +0100, Wolfram Sang wrote:
> On Fri, Mar 12, 2010 at 10:34:51AM -0800, Dmitry Torokhov wrote:
> > On Fri, Mar 12, 2010 at 08:03:49AM +0100, Wolfram Sang wrote:
> > > Commit 6992f5334995af474c2b58d010d08bc597f0f2fe introduced this requirement.
> > > Found with coccinelle, but fixed manually. Compile tested on X86 where
> > > possible.
> > > 
> > 
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
> 

Ah, right, size... I forgot about it. You are right, making the other 2
static is not an option.

-- 
Dmitry
