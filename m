From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 31 Aug 2017 10:31:33 +0000
Subject: Re: [alsa-devel] [PATCH] ALSA: ac97c: Fix an error handling path in 'atmel_ac97c_probe()'
Message-Id: <s5h1snsjaey.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831044042.23306-1-christophe.jaillet@wanadoo.fr>
 <20170831081021.g4luo557ggtnyfyg@piout.net>
 <20170831101903.avhj5tqywpvfsj4u@sirena.org.uk>
In-Reply-To: <20170831101903.avhj5tqywpvfsj4u@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, nicolas.ferre@microchip.com, garsilva@embeddedor.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, arvind.yadav.cs@gmail.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>, andriy.shevchenko@linux.intel.com, bhumirks@gmail.com

On Thu, 31 Aug 2017 12:19:03 +0200,
Mark Brown wrote:
> 
> On Thu, Aug 31, 2017 at 10:10:21AM +0200, Alexandre Belloni wrote:
> 
> > And here is the fallout of the stupid, brainless "fixing" of issues
> > reported by static analysis tools.
> 
> > This clk_prepare_enable will never fail. If it was going to fail, the
> > platform would never boot to a point were it is able to execute that
> > code. It is really annoying to have so much churn for absolutely 0
> > benefit.
> 
> It may currently be the case that the SoCs you're looking at happen to
> make this clock essential but that doesn't mean that it's not going to
> be different in some future SoC, nor that we can't have a software bug
> that this will detect.  Being consistent with our error checking also
> means that we can spot places where it might practically be a problem
> more easily, it's even easier if the error checking is there first time
> but it's still worth it to go back later.

... yes, but only when it's done correctly.

This is again a typical problem by such a trivial fix patch: the code
looks as if it were trivial and correct, buried in a patch series that
easily leads to the oversight by the maintainer's review.


thanks,

Takashi
