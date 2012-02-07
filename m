From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2012 06:54:29 +0000
Subject: Re: [PATCH] small speedup in 'nla_strlcpy' in file '\lib\nlattr.c'
Message-Id: <20120207065429.GA3554@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
List-Id: <kernel-janitors.vger.kernel.org>
References: <4F3041C3.70607@wanadoo.fr>
In-Reply-To: <4F3041C3.70607@wanadoo.fr>
To: kernel-janitors@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2012 at 10:10:27PM +0100, Christophe JAILLET wrote:
> Hi,
>=20
> I don't know if it worses a patch, but function 'nla_strlcpy' in
> file '\lib\nlattr.c' could be improved a bit.
> There is no need to memset(0) the whole buffer. Only the end of it
> has to be cleared.
>=20
> Usually, 'dstsize' is small (most of the time IFNAMSIZ =3D 16 bytes),
> so the gain should be real small, if noticeable.
>=20
> I'm not sure of who to cc: the mail. I've just added Alexey
> Kuznetsov which is one of the author of the modified file and still
> in the MAINTAINERS list.
>=20

So if we're not going to notice the speedup, then it's not worth it.
Mostly this is only used when people type "ifup eth0" and so a
speedup wouldn't even matter.  It is used in taskstats so maybe if
you did a benchmark and showed that it was faster then that would
be a compelling argument.  But every patch needs to have a reason to
apply it, and "maybe this helps but maybe not" is not good enough
salesmanship, you need actual data.

Use the ./scripts/get_maintainer.pl to find which places to send
this.

Also your email client mangled the patch so it doesn't apply.  Read
Documentation/email-clients.txt.  Send the patch to yourself first
and verify that you can do a "cat raw_email.txt | patch -p1".

regards,
dan carpenter



--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPMMqlAAoJEOnZkXI/YHqRxG4P/30Az1tFxsgQC/2MtuUW4gGn
Katm/dQAyovJ1QjKym1KPRkvsSf9P18yqMOinGkInUWcnhgaQAAKafp5HeDEs9P3
4NAsLP7cWZ7IoU4ZiEiASCq8lk3VkviyeqaX1i8vyEQS3VdY6wVsQAy5H0LSaSdG
1qp4McvzFGbDDkAGTg0w3UIIGfUfCOLwiDElF3m7mjangxitbrwnVh6+JTUx8XqQ
3Z/LOY3IRsTa6Koz7kNYP4P8A3Wd4pjy5cHRalAQ60TAO4XSCOjmkN8+PJ6IDxcr
zE0Phn9OrAVFV//Bn4u0x+GFK66KHqEZOPQIHc5i9ddVPEDDRJpVD8sNHafgFnnd
rUeO0gUi7xiGWIIMoInaYqsuqqpV18IlFZtt183oc/3WHMIB7r6l/J9gDJn+a1qA
m//zJI6aepV//wEJxCl1vxYZ/Zk2f0vDJwFnVCpQjhTy87wcfQZHoy7XhswBQ+1y
FNgf7nQYbLzpfhbXMVIb4Oll3MKlyAv+I09xjp6ROaEDDK5uIkktRYBoHW6UCHCa
Cg8djYqXn3ZuSpEFb+qMyCR7i7PCux035Juy9YV0iZ7jlUPdWgQg71KgRd6xLXwe
eq2sY1GYQpF9IurJAe4q+sykDOskpdxT0atdpX3SB65nsV7nzD8DUuglJf8HUQtL
5K/+wOBAB6yYdmb+Dyck
=3ILg
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
