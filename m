From: Ryan Anderson <ryan@autoweb.net>
Date: Mon, 28 Mar 2005 18:18:41 +0000
Subject: Re: [KJ] critical bug in strncpy()
Message-Id: <1112033922.1639.28.camel@ryan2.internal.autoweb.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80882305244240005=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200503281155.16199.vicente.feito@gmail.com>
In-Reply-To: <200503281155.16199.vicente.feito@gmail.com>
To: kernel-janitors@vger.kernel.org


--===============80882305244240005==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-vKeqn2tlY+JjCWGxYHbW"


--=-vKeqn2tlY+JjCWGxYHbW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2005-03-28 at 17:31 +0200, walter harms wrote:
> hi all,
>=20
> i do not think this is intended. surely you copy data from
> src to tmp++ but using a large value (> strlen(src) ) for count will=20
> access some strange areas where no code should go.

It's not a strange area, it's the rest of the destination buffer.
The rest of the destination buffer is filled with the value 0.  This
guarantees that strncpy prevents any information leakage via this
buffer.  This has the nice side effect that a buffer can be reused
without an explicit memset if you know that strncpy will be used to
repopulate it between uses.

This is a security feature.

src is not accessed beyond the minimum of strlen(src) and n, so there is
no chance of an out of bounds access on that, and the "n" that we are
given is the limit to the buffer pointed at by dest, so there is no out
of bounds access there.

> the defined behavier of strncpy is to copy a string that terminates with=20
> \0, count describes an upper limit what is reached first should=20
> terminate the copy. every version of strncpy works that way.
> maybe its not an critical bug (as src is not increased)  but
> 1. it *will* access unintended areas beyond  \0

src is not accessed beyond the minimum of strlen(src) and n, so there is
no chance of an out of bounds access on that, and the "n" that we are
given is the limit to the buffer pointed at by dest, so there is no out
of bounds access there.

> 2. rule of least surprise is violated

Well, I can't disagree here - but I don't think the surprise is in any
way detrimental.  There is simply no bug to exploit here.

> 3. other ppl may find other uses to this bug
> 4. the fix is simple

The fix opens a hole for potential information leakage to user space.

Have you audited all callers of strncpy to ensure that they do not
implicitly use this clearing of the buffer to guarantee that information
is not leaked to userspace?

>=20
> re,
> 	walter
>=20
>=20
> Ryan Anderson wrote:
> > On Mon, Mar 28, 2005 at 04:34:16PM +0200, walter harms wrote:
> >=20
> >>hi all,
> >>The kernel version of strcpy() is buggy. it copies ALWAYS n bytes.
> >>since i have NO idea if this is exploidable somehow, i would still
> >>recomend to REMOVE the code. See example below if you do not believe me=
.
> >>Also below you find a sniplet from libString/Strncpy.c.
> >=20
> >=20
> > The kernel version prevents information leakage by overwriting the rest
> > of the buffer with 0 after finishing the actual copy.
> >=20
> > I'm fairly certain the behavior was intendend.
> >=20
> >=20
> >>i did not provide a patch since this is NOT my code. (btw: changed the=20
> >>name from Strncopy to strncpy). C&P this in to the kernel/lib/string.c.
> >>
> >>
> >>re,
> >>	walter
> >>
> >>
> >>/* in case this is needed */
> >>Signed-off-by: walter harms <wharms@bfs.de>
> >>
> >>
> >>
> >>/* linux kernel */
> >>char * K_strncpy(char * dest,const char *src,size_t count)
> >>{
> >>        char *tmp =3D dest;
> >>
> >>        while (count) {
> >>                if ((*tmp =3D *src) !=3D 0) src++;    <-MISSING  case =
=3D=3D 0=20
> >>
> >>                tmp++;
> >>                count--;
> >>        }
> >>        printf("count=3D%d\n",count);
> >>        return dest;
> >>}
> >>
> >>int main()
> >>{
> >>char *src=3D"15" ;
> >>char dst[]=3D"123";
> >>
> >>K_strncpy(dst,src,500);
> >>
> >>}
> >>
> >>
> >>i looked a bit around and found these nice version.
> >>
> >>
> >>/*
> >> * libString, Copyright (C) 1999 Patrick Alken
> >> * This library comes with absolutely NO WARRANTY
> >> *
> >> * Should you choose to use and/or modify this source code, please
> >> * do so under the terms of the GNU General Public License under which
> >> * this library is distributed.
> >> *
> >> * $Id: Strncpy.c,v 1.1.1.1 2000/10/02 12:02:27 decho Exp $
> >> */
> >>
> >>#include <sys/types.h>
> >>
> >>/*
> >>Strncpy()
> >> Optimized version of strncpy().
> >>
> >>Inputs: dest   - destination string
> >>        source - source string
> >>        bytes  - number of bytes to copy
> >>
> >>NOTE: A terminating \0 character is only copied to 'dest' if
> >>      'source' is terminated by one, provided the limit 'bytes'
> >>      has not yet been reached.
> >>
> >>Return: destination string
> >>*/
> >>
> >>char *
> >>strncpy(char *dest, const char *source, const size_t bytes)
> >>
> >>{
> >>  register char *end =3D dest + bytes;
> >>  register char *s =3D dest;
> >>
> >>  while ((s < end) && (*s++ =3D *source++))
> >>    ;
> >>
> >>  return (dest);
> >>} /* Strncpy() */
> >>
> >>
> >=20
> >=20
> >>_______________________________________________
> >>Kernel-janitors mailing list
> >>Kernel-janitors@lists.osdl.org
> >>http://lists.osdl.org/mailman/listinfo/kernel-janitors
> >=20
> >=20
> >=20
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors
--=20
Ryan Anderson
AutoWeb Communications, Inc.
email: ryan@autoweb.net


--=-vKeqn2tlY+JjCWGxYHbW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCSEqBvV/uNaz8d+gRAofzAJ4icJY8ndMNtBLH253SamgaZ7w2awCeNA+u
Eyr1kVjexKffGNiDdyE1qGw=
=PRPe
-----END PGP SIGNATURE-----

--=-vKeqn2tlY+JjCWGxYHbW--

--===============80882305244240005==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80882305244240005==--
