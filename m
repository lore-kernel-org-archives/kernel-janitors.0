From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 03 Oct 2020 19:18:51 +0000
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate statements
Message-Id: <alpine.DEB.2.22.394.2010032118420.2741@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr> <160132172369.55460.9237357219623604216.b4-ty@kernel.org> <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com> <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com> <20201001110150.GA6715@sirena.org.uk> <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com> <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
In-Reply-To: <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>, tools@linux.kernel.org, linux-iio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, linux-acpi@vger.kernel.org, David Lechner <david@lechnology.com>, =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com, openipmi-developer@lists.sourceforge.net, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-ide@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-wireless@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>



On Sat, 3 Oct 2020, Konstantin Ryabitsev wrote:

> On Sat, Oct 03, 2020 at 11:40:48AM -0700, Joe Perches wrote:
> > (Adding tools and Konstantin Ryabitsev)
> >
> > There seems to be some mismatch between b4's use of the
> > cover letter to a patch series and what maintainers that
> > apply a subset of the patches in the patch series.
> >
> > The merge description shows the entire patch series as
> > applied, but the actual merge is only a subset of the
> > series.
> >
> > Can this be improved in b4?
>
> So, the following logic should be applied:
>
> - if the entire series was applied, reply to 0/n
> - if a subset only is applied, reply to each n/n of the patch that was
>   cherry-picked out of the series
>
> Is that an accurate summary?

That sounds good.

julia
