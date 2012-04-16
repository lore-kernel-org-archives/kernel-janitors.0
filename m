From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Apr 2012 22:31:38 +0000
Subject: Re: [Q] warning BUG() related fixing and janitors question
Message-Id: <20120416223138.GA22294@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
In-Reply-To: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Apr 16, 2012 at 06:12:07PM -0300, Ezequiel Garc=EDa wrote:
> Hi Dan,
>=20
> 2012/4/16 Dan Carpenter <dan.carpenter@oracle.com>:
> >
> > Don't start messing in scheduler code if you have any doubts about
> > what you are doing. =A0My advise is don't send a patch for this
> > warning. =A0Most times people leave BUG() enabled so we don't really
> > care about the warning.
>=20
> Okey. Perhaps I picked the wrong example, there are a whole bunch of warn=
ings
> related to the same BUG() stuff, here's a template example:
>=20
> void *p;
>=20
> switch (something) {
>   case a:
>     p =3D foo();
>   case b:
>     p =3D bar();
>   default:
>     BUG();
> }
>=20
> dosomething(p);
>=20
> --
>=20
> This will trigger warning "p could be used uninitialized" or something.
> I know most of us just leave BUG on, so you say these warnings aren't imp=
ortant?

Yeah.  Probably best to ignore them.

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
