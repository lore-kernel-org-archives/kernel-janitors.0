From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 31 Aug 2017 09:57:54 +0000
Subject: Re: [alsa-devel] [PATCH] ALSA: ac97c: Fix an error handling path in 'atmel_ac97c_probe()'
Message-Id: <20170831095754.t2impdwghk3z3tz6@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831044042.23306-1-christophe.jaillet@wanadoo.fr>
 <20170831081021.g4luo557ggtnyfyg@piout.net>
 <alpine.DEB.2.20.1708311020340.3243@hadrien>
 <1504170243.25945.170.camel@linux.intel.com>
 <20170831093557.mhr5txmaiox7gxiq@piout.net>
 <1504172297.25945.171.camel@linux.intel.com>
In-Reply-To: <1504172297.25945.171.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, garsilva@embeddedor.com, kernel-janitors@vger.kernel.org, nicolas.ferre@microchip.com, tiwai@suse.com, Julia Lawall <julia.lawall@lip6.fr>, broonie@kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, arvind.yadav.cs@gmail.com, bhumirks@gmail.com

On 31/08/2017 at 12:38:17 +0300, Andy Shevchenko wrote:
> On Thu, 2017-08-31 at 11:35 +0200, Alexandre Belloni wrote:
> > On 31/08/2017 at 12:04:03 +0300, Andy Shevchenko wrote:
> > > On Thu, 2017-08-31 at 10:23 +0200, Julia Lawall wrote:
> > > > 
> > > > On Thu, 31 Aug 2017, Alexandre Belloni wrote:
> > > > 
> > > > > On 31/08/2017 at 06:40:42 +0200, Christophe JAILLET wrote:
> > > > > > 
> 
> > > I didn't look into the code, though speculating it might be the case
> > > when CLK framework is not enabled, though many drivers are dependent
> > > to
> > > it, so, it would never fail in such cases.
> > 
> > It is not the case, it would return 0. Anyway, this will not happen
> > because that driver depends on ARCH_AT91 which selects COMMON_CLK_AT91
> > which selects COMMON_CLK.
> > 
> > > Nevertheless there might be
> > > other cases for CLK API to fail.
> > > 
> > 
> > The only case would be for a clock to be enabled without being
> > prepared
> > and this will never happen because clk_prepare_enable is used.
> > 
> > This call will just never fail.
> 
> So, then this is a bug of CLK API per se to have a prototype to return
> int, right?
> 

No because it may fail on other platforms.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
