From: David Miller <davem@davemloft.net>
Date: Tue, 11 Oct 2011 22:42:52 +0000
Subject: Re: [patch] cipso: remove an unneeded NULL check in
Message-Id: <20111011.184252.617974451481415643.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111011132228.GA27127@elgon.mountain>
	<CAHC9VhRMy-DbbkXSSWQPh8QgHAm5xzZ1qWJaYLiOERPagDfrbQ@mail.gmail.com>
	<20111011215549.GC30887@longonot.mountain>
In-Reply-To: <20111011215549.GC30887@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: dan.carpenter@oracle.com
Cc: paul@paul-moore.com, netdev@vger.kernel.org, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2011 00:55:49 +0300

> On Tue, Oct 11, 2011 at 05:20:11PM -0400, Paul Moore wrote:
>> > - =A0 =A0 =A0 if (doi_def =3D NULL || doi_def->doi =3D CIPSO_V4_DOI_UN=
KNOWN)
>> > + =A0 =A0 =A0 if (doi_def->doi =3D CIPSO_V4_DOI_UNKNOWN)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto doi_add_return;
>> > =A0 =A0 =A0 =A0for (iter =3D 0; iter < CIPSO_V4_TAG_MAXCNT; iter++) {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch (doi_def->tags[iter]) {
>>=20
>> I'd prefer to keep the NULL check in there as it does afford a little
>> bit of extra safety and this is management code after all, not
>> per-packet processing code, so the extra check should have no
>> observable performance impact.
>=20
> The dereferences on the lines before mean we would Oops before
> reaching the check.  But I guess I can move the check forward.  The
> error handling at goto doi_add_return relies on a non-NULL value for
> doi_def but I could just put a return in front of the dereference.
>=20
> 	if (!doi_def)
> 		return -EINVAL;
>=20
> I'll send a patch to do this tomorrow.

I think your original patch is still the best one.

Saying the NULL check should stay to provide "extra safety" is
complete garbage.  Especially since, as Dan shows, we dereference the
pointer before to damn check.

I'll therefore apply Dan's original patch.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
