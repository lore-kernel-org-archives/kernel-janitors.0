From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2012 09:14:49 +0000
Subject: Re: [patch] wireless: at76c50x: allocating too much data
Message-Id: <20120420091449.GI27101@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420064705.GE22649@elgon.mountain>
 <CAGRGNgVgtAYknmpB_8Q0OpcUWFjTxBistG+RNs1ORDZeckGsWw@mail.gmail.com>
In-Reply-To: <CAGRGNgVgtAYknmpB_8Q0OpcUWFjTxBistG+RNs1ORDZeckGsWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julian Calaby <julian.calaby@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 20, 2012 at 06:57:00PM +1000, Julian Calaby wrote:
> > - =A0 =A0 =A0 struct mib_local *m =3D kmalloc(sizeof(struct mib_phy), G=
FP_KERNEL);
> > + =A0 =A0 =A0 struct mib_local *m =3D kmalloc(sizeof(struct mib_local),=
 GFP_KERNEL);
>=20
> Would it be better practice to use sizeof(*m)?
>=20

That was my temptation as well...  But I decided to make it match
with the surrounding code.  I'm happy to resend if people want.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
