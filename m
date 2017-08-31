From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 31 Aug 2017 09:04:03 +0000
Subject: Re: [alsa-devel] [PATCH] ALSA: ac97c: Fix an error handling path in 'atmel_ac97c_probe()'
Message-Id: <1504170243.25945.170.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831044042.23306-1-christophe.jaillet@wanadoo.fr>
 <20170831081021.g4luo557ggtnyfyg@piout.net>
 <alpine.DEB.2.20.1708311020340.3243@hadrien>
In-Reply-To: <alpine.DEB.2.20.1708311020340.3243@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, garsilva@embeddedor.com, kernel-janitors@vger.kernel.org, nicolas.ferre@microchip.com, tiwai@suse.com, broonie@kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, arvind.yadav.cs@gmail.com, bhumirks@gmail.com

On Thu, 2017-08-31 at 10:23 +0200, Julia Lawall wrote:
> 
> On Thu, 31 Aug 2017, Alexandre Belloni wrote:
> 
> > On 31/08/2017 at 06:40:42 +0200, Christophe JAILLET wrote:
> > > If 'clk_prepare_enable()' fails, we must release some resources
> > > before
> > > returning. Add a new label in the existing error handling path and
> > > 'goto'
> > > there.
> > > 
> > > Fixes: 260ea95cc027 ("ASoC: atmel: ac97c: Handle return value of
> > > clk_prepare_enable.")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > 
> > And here is the fallout of the stupid, brainless "fixing" of issues
> > reported by static analysis tools.
> > 
> > This clk_prepare_enable will never fail. If it was going to fail,
> > the
> > platform would never boot to a point were it is able to execute that
> > code. It is really annoying to have so much churn for absolutely 0
> > benefit.
> 
> Would it be more productive to put the code back like it was before,
> ie no
> return value and no check, and add a comment to the definition of
> clk_prepare_enable indicating that there are many case where the call
> cannot fail?  Grepping through the code suggests that it is about 50-
> 50 on
> checking the return value or not doing so, which might suggest that
> checking the value is often not required.

I didn't look into the code, though speculating it might be the case
when CLK framework is not enabled, though many drivers are dependent to
it, so, it would never fail in such cases. Nevertheless there might be
other cases for CLK API to fail.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
