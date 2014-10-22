From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Wed, 22 Oct 2014 13:53:15 +0000
Subject: Re: [patch 2/2] staging: lustre: validate size in ll_setxattr()
Message-Id: <D7F59B16-D44D-46EC-ADED-AB1A1DBBCFB2@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141022081233.GB31384@mwanda>
In-Reply-To: <20141022081233.GB31384@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello!

On Oct 22, 2014, at 6:32 AM, Dan Carpenter wrote:
>> In that case, size =3D 0 seems to be the wrong value size for an lov par=
am
>> as well.
> I don't know about this.  The code is very clear that size =3D 0 is
> acceptable inside the if statement.  Oleg?

I am not sure what if statement do you mean?
If it's the "if ((strncmp(name, XATTR_TRUSTED_PREFIX," one then size of 0
does seem to be incorrect:

                struct lov_user_md *lump =3D (struct lov_user_md *)value;=20
// (I hope this is not a user pointer?)
=85
                if (lump !=3D NULL && lump->lmm_stripe_offset =3D 0)
                        lump->lmm_stripe_offset =3D -1;
// So, if lump is 0, we are already accessing past allowed range
=85
                        int lum_size =3D (lump->lmm_magic =3D LOV_USER_MAGI=
C_V1) ?
and again=85

Bye,
    Oleg

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
