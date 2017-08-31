From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 31 Aug 2017 09:35:57 +0000
Subject: Re: [alsa-devel] [PATCH] ALSA: ac97c: Fix an error handling path in 'atmel_ac97c_probe()'
Message-Id: <20170831093557.mhr5txmaiox7gxiq@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831044042.23306-1-christophe.jaillet@wanadoo.fr>
 <20170831081021.g4luo557ggtnyfyg@piout.net>
 <alpine.DEB.2.20.1708311020340.3243@hadrien>
 <1504170243.25945.170.camel@linux.intel.com>
In-Reply-To: <1504170243.25945.170.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, perex@perex.cz, tiwai@suse.com, arvind.yadav.cs@gmail.com, nicolas.ferre@microchip.com, broonie@kernel.org, garsilva@embeddedor.com, bhumirks@gmail.com, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 31/08/2017 at 12:04:03 +0300, Andy Shevchenko wrote:
> On Thu, 2017-08-31 at 10:23 +0200, Julia Lawall wrote:
> >=20
> > On Thu, 31 Aug 2017, Alexandre Belloni wrote:
> >=20
> > > On 31/08/2017 at 06:40:42 +0200, Christophe JAILLET wrote:
> > > > If 'clk_prepare_enable()' fails, we must release some resources
> > > > before
> > > > returning. Add a new label in the existing error handling path and
> > > > 'goto'
> > > > there.
> > > >=20
> > > > Fixes: 260ea95cc027 ("ASoC: atmel: ac97c: Handle return value of
> > > > clk_prepare_enable.")
> > > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > >=20
> > > And here is the fallout of the stupid, brainless "fixing" of issues
> > > reported by static analysis tools.
> > >=20
> > > This clk_prepare_enable will never fail. If it was going to fail,
> > > the
> > > platform would never boot to a point were it is able to execute that
> > > code. It is really annoying to have so much churn for absolutely 0
> > > benefit.
> >=20
> > Would it be more productive to put the code back like it was before,
> > ie no
> > return value and no check, and add a comment to the definition of
> > clk_prepare_enable indicating that there are many case where the call
> > cannot fail?=A0=A0Grepping through the code suggests that it is about 5=
0-
> > 50 on
> > checking the return value or not doing so, which might suggest that
> > checking the value is often not required.
>=20
> I didn't look into the code, though speculating it might be the case
> when CLK framework is not enabled, though many drivers are dependent to
> it, so, it would never fail in such cases.

It is not the case, it would return 0. Anyway, this will not happen
because that driver depends on ARCH_AT91 which selects COMMON_CLK_AT91
which selects COMMON_CLK.

> Nevertheless there might be
> other cases for CLK API to fail.
>=20

The only case would be for a clock to be enabled without being prepared
and this will never happen because clk_prepare_enable is used.

This call will just never fail.

--=20
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
