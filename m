From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Oct 2014 14:09:15 +0000
Subject: Re: [patch 2/2] staging: lustre: validate size in ll_setxattr()
Message-Id: <20141022140915.GH26918@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141022081233.GB31384@mwanda>
In-Reply-To: <20141022081233.GB31384@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Oct 22, 2014 at 01:53:15PM +0000, Drokin, Oleg wrote:
> Hello!
>=20
> On Oct 22, 2014, at 6:32 AM, Dan Carpenter wrote:
> >> In that case, size =3D 0 seems to be the wrong value size for an lov p=
aram
> >> as well.
> > I don't know about this.  The code is very clear that size =3D 0 is
> > acceptable inside the if statement.  Oleg?
>=20
> I am not sure what if statement do you mean?
> If it's the "if ((strncmp(name, XATTR_TRUSTED_PREFIX," one then size of 0
> does seem to be incorrect:
>=20
>                 struct lov_user_md *lump =3D (struct lov_user_md *)value;=
=20
> // (I hope this is not a user pointer?)

It's not.

> =E2=80=A6
>                 if (lump !=3D NULL && lump->lmm_stripe_offset =3D 0)
>                         lump->lmm_stripe_offset =3D -1;
> // So, if lump is 0, we are already accessing past allowed range

If size is zero then lump is NULL and the existing code is very careful
to test for that and avoid NULL dereferences.  I think that Andrew is
saying at it doesn't make sense for lump to be NULL.

Anyway, let me send a v2 which fixes the bug and leaves lump =3D NULL as
is.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
