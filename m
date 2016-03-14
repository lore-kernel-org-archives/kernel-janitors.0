From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 14 Mar 2016 20:43:48 +0000
Subject: Re: coccinelle: generalized removal of unnecessary pointer casts?
Message-Id: <alpine.DEB.2.02.1603142136490.2040@localhost6.localdomain6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1368920477-1457988229=:2040"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1457981670.11972.114.camel@perches.com>
In-Reply-To: <1457981670.11972.114.camel@perches.com>
To: cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1368920477-1457988229=:2040
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



On Mon, 14 Mar 2016, Joe Perches wrote:

> I wrote a little cocci script to remove unnecessary
> casts for memset and memcpy (below) and tested it on
> linux kernel's drivers/staging/ directory.
>=20
> For instance, when dst and src are already pointers:
>=20
> -	memcpy((u8 *)dst, (u8 *)src, r8712_get_wlan_bssid_ex_sz(src));
> +	memcpy(dst, src, r8712_get_wlan_bssid_ex_sz(src));
>=20
> It works ok, (it doesn't remove unnecessary parentheses
> around the pointers) but it makes me wonder if there's a
> generalized spatch mechanism to remove casts when an
> arbitrary function takes a void * in any argument
> position and a call to that function uses a cast of a
> pointer to any pointer type for that argument.
>=20
> $ cat remove_mem_casts.cocci=A0
> @@
> type t;
> t *p;
> type v;
> expression e1;
> expression e2;
> @@
>=20
> -	memset((v*)p, e1, e2)
> +	memset(p, e1, e2)
>=20
> @@
> type t;
> t *p;
> type v;
> expression e1;
> expression e2;
> @@
>=20
> -	memcpy((v*)p, e1, e2)
> +	memcpy(p, e1, e2)
>=20
> @@
> type t;
> t *p;
> type v;
> expression e1;
> expression e2;
> @@
>=20
> -	memcpy(e1, (v*)p, e2)
> +	memcpy(e1, p, e2)
>=20
> @@
> type t1;
> type t2;
> t1 *p1;
> t2 *p2;
> type v1;
> type v2;
> expression e1;
> @@
>=20
> -	memcpy((v1*)p1, (v2*)p2, e1)
> +	memcpy(p1, p2, e1)

This should do everything:

@@
identifier f;
expression *e;
type T;
@@

f(...,
- (T *)(
  e
- )
  ,...)

@@
identifier f;
expression *e;
type T;
@@

f(...,
- (T *)
  e
  ,...)

julia
--8323328-1368920477-1457988229=:2040--
