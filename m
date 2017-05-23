From: Andreas Dilger <adilger@dilger.ca>
Date: Tue, 23 May 2017 16:58:44 +0000
Subject: Re: [PATCH] fs/seq_file: remove some dead code
Message-Id: <7C1055EC-69E7-4892-B246-3D4E89376D2A@dilger.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail=_5A575E7F-F249-4AFF-906B-421F57BF54E8"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170520094904.45h7klchyzki2ini@mwanda>
In-Reply-To: <20170520094904.45h7klchyzki2ini@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org


--Apple-Mail=_5A575E7F-F249-4AFF-906B-421F57BF54E8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On May 20, 2017, at 3:49 AM, Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>=20
> We have never used this "err =3D PTR_ERR(p);" assignment and it annoys
> static checkers.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/fs/seq_file.c b/fs/seq_file.c
> index 13e8c092d4d2..d6f82ce288f4 100644
> --- a/fs/seq_file.c
> +++ b/fs/seq_file.c
> @@ -261,10 +261,8 @@ ssize_t seq_read(struct file *file, char __user =
*buf, size_t size, loff_t *ppos)
> 		size_t offs =3D m->count;
> 		loff_t next =3D pos;
> 		p =3D m->op->next(m, p, &next);
> -		if (!p || IS_ERR(p)) {
> -			err =3D PTR_ERR(p);
> +		if (!p || IS_ERR(p))
> 			break;
> -		}
> 		err =3D m->op->show(m, p);
> 		if (seq_has_overflowed(m) || err) {
> 			m->count =3D offs;

I'm guessing the static analysis is reporting that "err" is unused, =
because
it is clobbered after the end of the loop?

			if (likely(err <=3D 0))
				break;
		}
		pos =3D next;
	}
	m->op->stop(m, p);
	n =3D min(m->count, size);
	err =3D copy_to_user(buf, m->buf, n);
	if (err)
		goto Efault;

Unfortunately, this code dates back to the primordial "1da177e4" commit =
at
the start of Git history, so history to see how it got into this state.

Presumably, copy_to_user() is called unconditionally to return all data =
read
so far to userspace, and in that case "err" doesn't matter - something =
was
returned to userspace.  I was thinking that copy_to_user() should be =
skipped
if "n =3D=3D 0", so that the original "err" value is returned, but it =
may be that
this is never true in the "Fill:" case (ugh, upper-case labels).

	n =3D min(m->count, size);
	if (n =3D=3D 0)
		goto Done;

The logic isn't very clear here, so it isn't clear what the right change =
is.

Cheers, Andreas






--Apple-Mail=_5A575E7F-F249-4AFF-906B-421F57BF54E8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iD8DBQFZJGpFpIg59Q01vtYRAk9qAJ9KklqP4pMwf7uFV4fE5/IV7h6ZPwCePZVV
SldMi+JkFwc7FiiqqAlglcU=
=+hjX
-----END PGP SIGNATURE-----

--Apple-Mail=_5A575E7F-F249-4AFF-906B-421F57BF54E8--
