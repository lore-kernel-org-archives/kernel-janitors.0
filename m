From: Dan Carpenter <error27@gmail.com>
Date: Mon, 12 Jul 2010 17:37:14 +0000
Subject: Re: [patch] prism54: call BUG_ON() earlier
Message-Id: <20100712173714.GD5658@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100710085338.GQ19184@bicker> <AANLkTikJ9Ae2HRIwdcc8oVgAc2zoVHUL7ZY9k2QO2QpS@mail.gmail.com>
In-Reply-To: <AANLkTikJ9Ae2HRIwdcc8oVgAc2zoVHUL7ZY9k2QO2QpS@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "Luis R. Rodriguez" <mcgrof@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, Jiri Kosina <jkosina@suse.cz>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 12, 2010 at 10:06:55AM -0700, Luis R. Rodriguez wrote:
> On Sat, Jul 10, 2010 at 1:53 AM, Dan Carpenter <error27@gmail.com> wrote:
> > This test is off by one because strlen() doesn't include the NULL
> > terminator.
> >
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> >
> > diff --git a/drivers/net/wireless/prism54/isl_ioctl.c b/drivers/net/wir=
eless/prism54/isl_ioctl.c
> > index 8d1190c..1051268 100644
> > --- a/drivers/net/wireless/prism54/isl_ioctl.c
> > +++ b/drivers/net/wireless/prism54/isl_ioctl.c
> > @@ -2067,7 +2067,7 @@ send_simple_event(islpci_private *priv, const cha=
r *str)
> > =A0 =A0 =A0 =A0memptr =3D kmalloc(IW_CUSTOM_MAX, GFP_KERNEL);
> > =A0 =A0 =A0 =A0if (!memptr)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> > - =A0 =A0 =A0 BUG_ON(n > IW_CUSTOM_MAX);
> > + =A0 =A0 =A0 BUG_ON(n >=3D IW_CUSTOM_MAX);
> > =A0 =A0 =A0 =A0wrqu.data.pointer =3D memptr;
> > =A0 =A0 =A0 =A0wrqu.data.length =3D n;
> > =A0 =A0 =A0 =A0strcpy(memptr, str);
> >
>=20
> send_simple_event() never passes a NULL terminated string though. What
> does this fix today? If nothing then better leave as-is.
>=20
>   Luis

It doesn't fix any bugs in the current code, but it's a necessary clean
up.

        memptr =3D kmalloc(IW_CUSTOM_MAX, GFP_KERNEL);
	                 ^^^^^^^^^^^^^
	This is the size of memptr.

        if (!memptr)
                return;
        BUG_ON(n > IW_CUSTOM_MAX);

	^^^^^^^^^^^^^^^^^^^^^^^^^^
	This is an off-by-one check.

        wrqu.data.pointer =3D memptr;
        wrqu.data.length =3D n;
        strcpy(memptr, str);
	^^^^^^^^^^^^^^^^^^^^

	This would be a silent memory corruption.

In the current code we only use short event strings so the check isn't
needed.  But we should either correct the check or remove it.

regards,
dan carpenter


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
