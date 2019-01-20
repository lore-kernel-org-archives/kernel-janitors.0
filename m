From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 20 Jan 2019 20:04:09 +0000
Subject: Re: [PATCH -next] selinux: Fix error return code in policydb_read()
Message-Id: <20190121070410.1c90552f@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/eiBn__9W+5j3iIteUcllmTy"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547821427-157169-1-git-send-email-weiyongjun1@huawei.com>
        <CAHC9VhSbtqhiMQdNJ_6yeX5+ggwVNyGYXe-E=bMj2V2z2MmAsA@mail.gmail.com>
        <20190119112148.375edf4c@canb.auug.org.au>
In-Reply-To: <20190119112148.375edf4c@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, peter enderborg <peter.enderborg@sony.com>, Kent Overstreet <kent.overstreet@gmail.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Ondrej Mosnacek <omosnace@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org

--Sig_/eiBn__9W+5j3iIteUcllmTy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, 19 Jan 2019 11:21:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 18 Jan 2019 16:28:07 -0500 Paul Moore <paul@paul-moore.com> wrote:
> >
> > On Fri, Jan 18, 2019 at 9:18 AM Wei Yongjun <weiyongjun1@huawei.com> wr=
ote: =20
> > >
> > > Fix to return a negative error code -ENOMEM from the error handling
> > > case instead of 0, as done elsewhere in this function.
> > >
> > > Fixes: 31696241e96e ("selinux: convert to kvmalloc")   =20
> >=20
> > Unfortunately this commit isn't to be found in any of the SELinux
> > branches, or Linus' master branch; based on the subject line I'm
> > guessing the original patch is in a -next branch somewhere.  Please
> > find whoever pushed this patch to linux-next and have them apply the
> > fix. =20
>=20
> Yeah, Kent has a series doing conversions that is in Andrew Morton's
> mmotm patch series.

I have added that patch to the akpm-current tree in linux-next from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/eiBn__9W+5j3iIteUcllmTy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxE1DoACgkQAVBC80lX
0GzXVAgAmOkvxTlVZZNL/cxrZq/LeYTgmjkLtt0L23Xkjoqw4oh+7jZx4Kpj4WwV
wr16k6rczB50NXNoWp8piajaSTtN1ClRCxIBaDwwc678GHDImxg8mN9bWUv6862L
Q9FLPKzEH7D6GKrdaK3Jya3bUc7wsQ85i0M5mngm86ftI4r5EMHvbJHoI3UnI981
XBwIdqJ20txvUgqwss3FzZzCrcQGl/xdj61C5O3ovreAPIZJKj3lM2fBFzmJPHD0
YiweP9ESPNP7Qdb4tYX90kQVdzLAqny4DY1zfFa03V1MsSB1lLa8soCCzrBNN2pn
olqsUZZSpV80EzFAJvnviQ8Uc/ETrA==
=yqDz
-----END PGP SIGNATURE-----

--Sig_/eiBn__9W+5j3iIteUcllmTy--
