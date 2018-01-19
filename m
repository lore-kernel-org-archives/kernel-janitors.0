From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Date: Fri, 19 Jan 2018 23:59:49 +0000
Subject: Re: [PATCH] platform/x86: dell-smbios: Fix error handling in build_tokens_sysfs()
Message-Id: <20180119235949.324u2ysqxazn2tpc@pali>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180118104503.GA30055@mwanda>
 <5A607BF6.6090800@bfs.de>
 <20180118110334.v33ypxsavbmq6qpu@mwanda>
 <5A6082FA.1040608@bfs.de>
 <CAHp75Vc8jTpBEYc5eVx8saCXBU=SMEbbBO0zuD=8c+idSR1FFg@mail.gmail.com>
 <CAHp75Vewk1gu0y3=icJnrkv1NP+-tf-YWTTyU1Vf42FLG-c2Kg@mail.gmail.com>
In-Reply-To: <CAHp75Vewk1gu0y3=icJnrkv1NP+-tf-YWTTyU1Vf42FLG-c2Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: wharms@bfs.de, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>

On Thursday 18 January 2018 21:24:44 Andy Shevchenko wrote:
> Walter, please, do not shrink Cc list until you sure person / people
> in question is/are not interested in the topic.
>=20
>=20
> On Thu, Jan 18, 2018 at 9:21 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Jan 18, 2018 at 1:20 PM, walter harms <wharms@bfs.de> wrote:
> >> Am 18.01.2018 12:03, schrieb Dan Carpenter:
> >>> On Thu, Jan 18, 2018 at 11:50:30AM +0100, walter harms wrote:
> >
> >>>>>  out_unwind_strings:
> >>>>> -   for (i =3D i-1; i > 0; i--) {
> >>>>> +   for (i =3D i-1; i >=3D 0; i--) {
> >>>>>             kfree(token_location_attrs[i].attr.name);
> >>>>>             kfree(token_value_attrs[i].attr.name);
> >>>>>     }
> >
> >>>> would you mind to reverse order here ?
> >>>> you know programmers are terrible at couting backwards.
> >>>
> >>> I prefer to always unwind in reverse order so I'd prefer to leave it
> >>> as-is.
> >
> >> It is just a comment from my side. we can leave the actual decision to=
 the
> >> current maintainer.
> >
> > Right.
> > And maintainer would like to see simple:
> >
> > while (i--) {
> >     kfree(token_location_attrs[i].attr.name);
> >     kfree(token_value_attrs[i].attr.name);
> > }

For me this looks better.

> >
> > --
> > With Best Regards,
> > Andy Shevchenko
>=20
>=20
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
