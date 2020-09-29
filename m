From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 29 Sep 2020 12:47:29 +0000
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate statements
Message-Id: <alpine.DEB.2.22.394.2009291445050.2808@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr> <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com> <20200929124108.GY4282@kadam>
In-Reply-To: <20200929124108.GY4282@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, linux-iio@vger.kernel.org, drbd-dev@tron.linbit.com, =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, David Lechner <david@lechnology.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-wireless@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, linux-block@vger.kernel.org, linux-ide@vger.kernel.org, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Joe Perches <joe@perches.com>, linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>



On Tue, 29 Sep 2020, Dan Carpenter wrote:

> On Tue, Sep 29, 2020 at 02:20:00PM +0200, Ard Biesheuvel wrote:
> > On Sun, 27 Sep 2020 at 21:56, Julia Lawall <Julia.Lawall@inria.fr> wrote:
> > >
> > > These patches replace commas by semicolons.
> >
> >
> > Why?
> >
>
> In the best case, these commas are just uninitentional mess, like typing
> an extra space character or something.  I've looked at them before and
> one case I see where they are introduced is when people convert a
> struct initializer to code.
>
> -	struct foo {
> -		.a = 1,
> -		.b = 2,
>  		...
> +	foo.a = 1,
> +	foo.b = 2,
>
> The times where commas are used deliberately to replace curly braces are
> just evil.  Either way the code is cleaner with semi-colons.

I also found exaamples like the following to be particularly unforunate:

                                fprintf(stderr,
                                        "page_nr %lu wrong count %Lu %Lu\n",
                                       page_nr, count,
                                       count_verify[page_nr]), exit(1);

The exit is very hard to see, unless you know to look for it.

julia
