From: Mark Brown <broonie@kernel.org>
Date: Tue, 29 Sep 2020 12:37:34 +0000
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate statements
Message-Id: <20200929123734.GC4799@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="MnLPg7ZWsaic7Fhd"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <alpine.DEB.2.22.394.2009291344590.2808@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2009291344590.2808@hadrien>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Joe Perches <joe@perches.com>, linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, linux-acpi@vger.kernel.org, David Lechner <david@lechnology.com>, Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com, openipmi-developer@lists.sourceforge.net, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-ide@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-wireless@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2020 at 01:46:19PM +0200, Julia Lawall wrote:
> On Tue, 29 Sep 2020, Mark Brown wrote:

> > Feel free to submit patches to b4.  Ideally things like this wouldn't be
> > being sent as serieses in the first place, there's no dependencies or
> > interactions between the patches.

> It was suggested (a long time ago, not with respect to this patch in
> particular) that sending such patches in a series is useful because it
> allows people who are not interested in the 18 patches to skip over them
> more easily.  So there are two conflicting needs...

I'm not convinced that there are huge numbers of people reading LKML as
a list TBH, and if you are sending things as a series then the way
you're doing it at the minute where you don't CC the cover letter to
people makes things confusing as it's unclear if there are dependencies
to worry about.

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9zKo0ACgkQJNaLcl1U
h9BJ9wf4mEIT3UglAONn9EPv4I6DolXuWfJHGs52mxyy1JeuXGyjVMYRuKfw8ZE5
TbgRR0pAg1aZUsqI/T/PWSVDmUCNzL6QM4RbG8ZUSFw47v509iCABBidbK+PLnwo
y5A+IrAPTDVviLFNJm2SfFN3XEgpsGmOqhyuhKiGNeLOryaPNvOmiRF6cwND7Vbq
97kDmafX0KgHVsmK/br50D/XJpOJSR9T2hB5hjQRoVl44a6aV0eZWwDDZyH57kat
KO59OyGGHDyWrsF9oHWajymCB1kMZZ4YLiwCyjx98g74uRLSiSaGwrsr4IeXGn66
Mmpn90mfVDnP/Es10vbKsC+JZShG
=qH7V
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
