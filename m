From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sat, 19 Jan 2019 00:21:48 +0000
Subject: Re: [PATCH -next] selinux: Fix error return code in policydb_read()
Message-Id: <20190119112148.375edf4c@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/gJMqX_JE6fFGnAWox8.kY=v"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547821427-157169-1-git-send-email-weiyongjun1@huawei.com>
        <CAHC9VhSbtqhiMQdNJ_6yeX5+ggwVNyGYXe-E=bMj2V2z2MmAsA@mail.gmail.com>
In-Reply-To: <CAHC9VhSbtqhiMQdNJ_6yeX5+ggwVNyGYXe-E=bMj2V2z2MmAsA@mail.gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, peter enderborg <peter.enderborg@sony.com>, Kent Overstreet <kent.overstreet@gmail.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Ondrej Mosnacek <omosnace@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org

--Sig_/gJMqX_JE6fFGnAWox8.kY=v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, 18 Jan 2019 16:28:07 -0500 Paul Moore <paul@paul-moore.com> wrote:
>
> On Fri, Jan 18, 2019 at 9:18 AM Wei Yongjun <weiyongjun1@huawei.com> wrot=
e:
> >
> > Fix to return a negative error code -ENOMEM from the error handling
> > case instead of 0, as done elsewhere in this function.
> >
> > Fixes: 31696241e96e ("selinux: convert to kvmalloc") =20
>=20
> Unfortunately this commit isn't to be found in any of the SELinux
> branches, or Linus' master branch; based on the subject line I'm
> guessing the original patch is in a -next branch somewhere.  Please
> find whoever pushed this patch to linux-next and have them apply the
> fix.

Yeah, Kent has a series doing conversions that is in Andrew Morton's
mmotm patch series.
--=20
Cheers,
Stephen Rothwell

--Sig_/gJMqX_JE6fFGnAWox8.kY=v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxCbZwACgkQAVBC80lX
0Gxvuwf/YOlqbpyIQythZbyTUStxs0jyEpMdah/xAtwgi0NcMzuyPpzjmobJxtrL
ra/V6iwHuvW3Uolci5HXGWJgBYyOt254ukCD6swbWo+L/3R+wXsLyxgGW4ABQ7Wp
Z8h+z4TJA7VN1oaIJjxgpiwd4z2AlhVIctk4UN7uZuDSFdZtHq7A5ZJ5UZv9XYBt
cNg/9hQsZe7EUNw0BRoJj4n1XDFXP+SPx+AU6bqDlCqOiUc1H/61PaGwfKUx/H2m
7jsIX4nKJLUPLRyyBHsYVy0fgISwkY4QRBJD7S6NRUVFpL7M0xIsgxpmotX2mVLG
FSXueEpf1dmEeDHJPpeDGegvBs0cBA==
=S/Wr
-----END PGP SIGNATURE-----

--Sig_/gJMqX_JE6fFGnAWox8.kY=v--
