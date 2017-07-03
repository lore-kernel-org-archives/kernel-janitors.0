From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 03 Jul 2017 11:42:01 +0000
Subject: Re: [PATCH 9/9] mfd: max8925-i2c: Drop unnecessary static
Message-Id: <20170703114201.ybafidokvrwg4how@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
 <1493928654-18768-10-git-send-email-Julia.Lawall@lip6.fr>
 <CAGXu5jJdxyXtL09ps1o5LYVDvfqEbymAXz=wvQD6cysnvnacUA@mail.gmail.com>
In-Reply-To: <CAGXu5jJdxyXtL09ps1o5LYVDvfqEbymAXz=wvQD6cysnvnacUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Kees Cook <keescook@chromium.org>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>

On Tue, 27 Jun 2017, Kees Cook wrote:

> On Thu, May 4, 2017 at 1:10 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> > Drop static on a local variable, when the variable is initialized before
> > any use, on every possible execution path through the function.  The st=
atic
> > has no benefit, and dropping it reduces the code size.
> >
> > The semantic patch that fixes this problem is as follows:
> > (http://coccinelle.lip6.fr/)
> >
> > // <smpl>
> > @bad exists@
> > position p;
> > identifier x;
> > type T;
> > @@
> >
> > static T x@p;
> > ...
> > x =3D <+...x...+>
> >
> > @@
> > identifier x;
> > expression e;
> > type T;
> > position p !=3D bad.p;
> > @@
> >
> > -static
> >  T x@p;
> >  ... when !=3D x
> >      when strict
> > ?x =3D e;
> > // </smpl>
> >
> > The change in code size is indicates by the following output from the s=
ize
> > command.
> >
> > before:
> >    text    data     bss     dec     hex filename
> >    2579     240      16    2835     b13 drivers/mfd/max8925-i2c.o
> >
> > after:
> >    text    data     bss     dec     hex filename
> >    2531     240       8    2779     adb drivers/mfd/max8925-i2c.o
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> >  drivers/mfd/max8925-i2c.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
> > index 5c80aea..1006323 100644
> > --- a/drivers/mfd/max8925-i2c.c
> > +++ b/drivers/mfd/max8925-i2c.c
> > @@ -151,7 +151,7 @@ static int max8925_probe(struct i2c_client *client,
> >                                    const struct i2c_device_id *id)
> >  {
> >         struct max8925_platform_data *pdata =3D dev_get_platdata(&clien=
t->dev);
> > -       static struct max8925_chip *chip;
> > +       struct max8925_chip *chip;
> >         struct device_node *node =3D client->dev.of_node;
> >
> >         if (node && !pdata) {
> >
>=20
> Acked-by: Kees Cook <keescook@chromium.org>
>=20
> Kernel janitors or Andrew, can you pick this up?

Didn't see this before.

Thanks for the poke Kees, I will pick this up in due course.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
