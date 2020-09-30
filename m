From: Joe Perches <joe@perches.com>
Date: Wed, 30 Sep 2020 19:33:39 +0000
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate statements
Message-Id: <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
         <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
         <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
         <20200929113745.GB4799@sirena.org.uk>
In-Reply-To: <20200929113745.GB4799@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, linux-acpi@vger.kernel.org, David Lechner <david@lechnology.com>, Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com, openipmi-developer@lists.sourceforge.net, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-ide@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-wireless@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>

On Tue, 2020-09-29 at 12:37 +0100, Mark Brown wrote:
> On Mon, Sep 28, 2020 at 05:45:24PM -0700, Joe Perches wrote:
> > On Mon, 2020-09-28 at 20:35 +0100, Mark Brown wrote:
> > > [1/1] regmap: debugfs: use semicolons rather than commas to separate statements
> > >       commit: 7f4a122d0b50b40c64d24a5cf7aafe26dd9487ee
> > Rather than replying to the 0/n cover letter to a patch
> > series, can you reply to each of the specific patches in
> > the patch series you are applying?
> > Otherwise, it's a bit difficult to figure out which patches
> > you are applying.
> 
> Feel free to submit patches to b4.

Have you tried the existing option to send
thank you's on a specific ranges of patches?

b4 ty
~~~~~
usage:
  b4 ty [-h] [-g GITDIR] [-o OUTDIR] [-l] [-s SEND [SEND ...]] [-d DISCARD [DISCARD ...]] [-a] [-b BRANCH] [--since SINCE]

[]
 -s SEND, --send SEND  Generate thankyous for specific entries from -l (e.g.: 1,3-5,7-; or "all")
