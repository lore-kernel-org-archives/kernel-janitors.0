From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 29 Sep 2020 11:46:19 +0000
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate statements
Message-Id: <alpine.DEB.2.22.394.2009291344590.2808@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr> <160132172369.55460.9237357219623604216.b4-ty@kernel.org> <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com> <20200929113745.GB4799@sirena.org.uk>
In-Reply-To: <20200929113745.GB4799@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: Joe Perches <joe@perches.com>, linux-iio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, linux-acpi@vger.kernel.org, David Lechner <david@lechnology.com>, =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com, openipmi-developer@lists.sourceforge.net, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-ide@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-wireless@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>



On Tue, 29 Sep 2020, Mark Brown wrote:

> On Mon, Sep 28, 2020 at 05:45:24PM -0700, Joe Perches wrote:
> > On Mon, 2020-09-28 at 20:35 +0100, Mark Brown wrote:
>
> > > [1/1] regmap: debugfs: use semicolons rather than commas to separate statements
> > >       commit: 7f4a122d0b50b40c64d24a5cf7aafe26dd9487ee
>
> > Rather than replying to the 0/n cover letter to a patch
> > series, can you reply to each of the specific patches in
> > the patch series you are applying?
>
> > Otherwise, it's a bit difficult to figure out which patches
> > you are applying.
>
> Feel free to submit patches to b4.  Ideally things like this wouldn't be
> being sent as serieses in the first place, there's no dependencies or
> interactions between the patches.

It was suggested (a long time ago, not with respect to this patch in
particular) that sending such patches in a series is useful because it
allows people who are not interested in the 18 patches to skip over them
more easily.  So there are two conflicting needs...

julia
