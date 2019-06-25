From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 25 Jun 2019 07:30:16 +0000
Subject: Re: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before devm_platform_ioremap_resource()
Message-Id: <20190625073016.GA18381@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190221162627.3476-1-brgl@bgdev.pl>
 <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
 <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net>
 <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
 <1dd52704-0e41-db31-33f4-c9f446a47344@metux.net>
 <CAMRc=Mfp85diy849r_8UHKS9eao26djrsMF0_iwE--d62mQ5jg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfp85diy849r_8UHKS9eao26djrsMF0_iwE--d62mQ5jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Enrico Weigelt, metux IT consult" <lkml@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Markus Elfring <Markus.Elfring@web.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Jun 25, 2019 at 09:10:25AM +0200, Bartosz Golaszewski wrote:
> pon., 24 cze 2019 o 20:22 Enrico Weigelt, metux IT consult
> <lkml@metux.net> napisa=C5=82(a):
> >
> > On 24.06.19 12:46, Bartosz Golaszewski wrote:
> >
> > >> The patch seems pretty trivial and doesn't change any actual code, so
> > >> I don't see hard resons for rejecting it.
> > >>
> > >
> > > In its current form it makes the code even less readable. The #ifdef
> > > should actually be one line lower and touch the comment instead of the
> > > EXPORT_SYMBOL() related to a different function.
> >
> > Okay, that missing newline should be fixed (as well as the extra one
> > after the #ifdef). Besides that, I don't see any further problems.
> >
>=20
> Are we sure this even changes something? Does kernel documentation get
> generated according to current config options? I really think this
> patch just pollutes the history for now apparent reason.
>=20
> Greg, could you give your opinion on this?

Why are you all arguing with a all-but-instinguishable-from-a-bot
persona about a patch that I will never apply?

greg k-h
