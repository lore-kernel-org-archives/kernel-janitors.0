From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Oct 2011 21:55:49 +0000
Subject: Re: [patch] cipso: remove an unneeded NULL check in
Message-Id: <20111011215549.GC30887@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111011132228.GA27127@elgon.mountain>
 <CAHC9VhRMy-DbbkXSSWQPh8QgHAm5xzZ1qWJaYLiOERPagDfrbQ@mail.gmail.com>
In-Reply-To: <CAHC9VhRMy-DbbkXSSWQPh8QgHAm5xzZ1qWJaYLiOERPagDfrbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Paul Moore <paul@paul-moore.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, kernel-janitors@vger.kernel.org

On Tue, Oct 11, 2011 at 05:20:11PM -0400, Paul Moore wrote:
> > - =A0 =A0 =A0 if (doi_def =3D NULL || doi_def->doi =3D CIPSO_V4_DOI_UNK=
NOWN)
> > + =A0 =A0 =A0 if (doi_def->doi =3D CIPSO_V4_DOI_UNKNOWN)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto doi_add_return;
> > =A0 =A0 =A0 =A0for (iter =3D 0; iter < CIPSO_V4_TAG_MAXCNT; iter++) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch (doi_def->tags[iter]) {
>=20
> I'd prefer to keep the NULL check in there as it does afford a little
> bit of extra safety and this is management code after all, not
> per-packet processing code, so the extra check should have no
> observable performance impact.

The dereferences on the lines before mean we would Oops before
reaching the check.  But I guess I can move the check forward.  The
error handling at goto doi_add_return relies on a non-NULL value for
doi_def but I could just put a return in front of the dereference.

	if (!doi_def)
		return -EINVAL;

I'll send a patch to do this tomorrow.

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
