From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 29 Sep 2020 12:44:29 +0000
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate statements
Message-Id: <alpine.DEB.2.22.394.2009291441530.2808@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr> <160132172369.55460.9237357219623604216.b4-ty@kernel.org> <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com> <20200929113745.GB4799@sirena.org.uk> <alpine.DEB.2.22.394.2009291344590.2808@hadrien>
 <20200929123734.GC4799@sirena.org.uk>
In-Reply-To: <20200929123734.GC4799@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: Julia Lawall <julia.lawall@inria.fr>, Joe Perches <joe@perches.com>, linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, linux-acpi@vger.kernel.org, David Lechner <david@lechnology.com>, =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com, openipmi-developer@lists.sourceforge.net, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-ide@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-wireless@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>



On Tue, 29 Sep 2020, Mark Brown wrote:

> On Tue, Sep 29, 2020 at 01:46:19PM +0200, Julia Lawall wrote:
> > On Tue, 29 Sep 2020, Mark Brown wrote:
>
> > > Feel free to submit patches to b4.  Ideally things like this wouldn't be
> > > being sent as serieses in the first place, there's no dependencies or
> > > interactions between the patches.
>
> > It was suggested (a long time ago, not with respect to this patch in
> > particular) that sending such patches in a series is useful because it
> > allows people who are not interested in the 18 patches to skip over them
> > more easily.  So there are two conflicting needs...
>
> I'm not convinced that there are huge numbers of people reading LKML as
> a list TBH, and if you are sending things as a series then the way
> you're doing it at the minute where you don't CC the cover letter to
> people makes things confusing as it's unclear if there are dependencies
> to worry about.

The cover letter goes to all of the specific mailing lists affected by the
patch, or if there is no list, then to at least one developer.  Sending
the cover letter to everyone would lead to too many recipients for some
lists.

If there is a preference for the rest of these patches to be sent one by
one, then that is possible.

julia
