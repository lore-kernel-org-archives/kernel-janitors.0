From: Joe Perches <joe@perches.com>
Date: Mon, 14 Mar 2016 22:23:58 +0000
Subject: Re: coccinelle: generalized removal of unnecessary pointer casts?
Message-Id: <1457994238.11972.138.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1457981670.11972.114.camel@perches.com>
 <alpine.DEB.2.02.1603142136490.2040@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1603142136490.2040@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr

On Mon, 2016-03-14 at 21:43 +0100, Julia Lawall wrote:
> On Mon, 14 Mar 2016, Joe Perches wrote:
> > I wrote a little cocci script to remove unnecessary
> > casts for memset and memcpy (below) and tested it on
> > linux kernel's drivers/staging/ directory.
> >=A0
> > For instance, when dst and src are already pointers:
> >=A0
> > -=A0=A0=A0=A0=A0memcpy((u8 *)dst, (u8 *)src, r8712_get_wlan_bssid_ex_sz=
(src));
> > +=A0=A0=A0=A0=A0memcpy(dst, src, r8712_get_wlan_bssid_ex_sz(src));
> >=A0
> > It works ok, (it doesn't remove unnecessary parentheses
> > around the pointers) but it makes me wonder if there's a
> > generalized spatch mechanism to remove casts when an
> > arbitrary function takes a void * in any argument
> > position and a call to that function uses a cast of a
> > pointer to any pointer type for that argument.
> >=A0
> > $ cat remove_mem_casts.cocci=A0
> > @@
> > type t;
> > t *p;
> > type v;
> > expression e1;
> > expression e2;
> > @@
> >=A0
> > -=A0=A0=A0=A0=A0memset((v*)p, e1, e2)
> > +=A0=A0=A0=A0=A0memset(p, e1, e2)
> >=A0
> > @@
> > type t;
> > t *p;
> > type v;
> > expression e1;
> > expression e2;
> > @@
> >=A0
> > -=A0=A0=A0=A0=A0memcpy((v*)p, e1, e2)
> > +=A0=A0=A0=A0=A0memcpy(p, e1, e2)
> >=A0
> > @@
> > type t;
> > t *p;
> > type v;
> > expression e1;
> > expression e2;
> > @@
> >=A0
> > -=A0=A0=A0=A0=A0memcpy(e1, (v*)p, e2)
> > +=A0=A0=A0=A0=A0memcpy(e1, p, e2)
> >=A0
> > @@
> > type t1;
> > type t2;
> > t1 *p1;
> > t2 *p2;
> > type v1;
> > type v2;
> > expression e1;
> > @@
> >=A0
> > -=A0=A0=A0=A0=A0memcpy((v1*)p1, (v2*)p2, e1)
> > +=A0=A0=A0=A0=A0memcpy(p1, p2, e1)
>=20
> This should do everything:
>=20
> @@
> identifier f;
> expression *e;
> type T;
> @@
>=20
> f(...,
> - (T *)(
> =A0 e
> - )
> =A0 ,...)
>=20
> @@
> identifier f;
> expression *e;
> type T;
> @@
>=20
> f(...,
> - (T *)
> =A0 e
> =A0 ,...)
>=20
> julia

Hi Julia,

I think your proposed script is not correct.
The function must take a void * argument.
There's no validation of that here.

cheers, Joe
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
