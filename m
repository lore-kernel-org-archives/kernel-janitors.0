From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Apr 2012 12:45:23 +0000
Subject: Re: [patch] wireless: at76c50x: allocating too much data
Message-Id: <20120421124523.GS6498@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420064705.GE22649@elgon.mountain>
 <CAGRGNgVgtAYknmpB_8Q0OpcUWFjTxBistG+RNs1ORDZeckGsWw@mail.gmail.com>
 <20120420091449.GI27101@mwanda>
 <87vcku9sob.fsf@purkki.adurom.net>
In-Reply-To: <87vcku9sob.fsf@purkki.adurom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kalle Valo <kvalo@adurom.com>
Cc: Julian Calaby <julian.calaby@gmail.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 20, 2012 at 09:14:44PM +0300, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>=20
> > On Fri, Apr 20, 2012 at 06:57:00PM +1000, Julian Calaby wrote:
> >> > - =A0 =A0 =A0 struct mib_local *m =3D kmalloc(sizeof(struct mib_phy)=
, GFP_KERNEL);
> >> > + =A0 =A0 =A0 struct mib_local *m =3D kmalloc(sizeof(struct mib_loca=
l), GFP_KERNEL);
> >>=20
> >> Would it be better practice to use sizeof(*m)?
> >>=20
> >
> > That was my temptation as well...  But I decided to make it match
> > with the surrounding code.  I'm happy to resend if people want.
>=20
> IMHO sizeof(*m) is better and I tend to use it.
>=20
> Related to this: I have a bad habit of sometimes dropping '*' from
> sizeof()? Is there a tool which could spot that?
>=20

That's what I was working on for Smatch when I sent this patch.

The odd thing is that I can't find any bugs like this in the kernel.
If sizeof(foo) is less than sizeof(*foo), which is probably the
normal case, then these get caught early on in testing.

Still I think people must have done manual audits as well...  It
feels too clean to be natural.

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
