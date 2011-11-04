From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Nov 2011 10:54:46 +0000
Subject: Re: [PATCH 1/4] drivers/staging/vt6656/wpa2.h: Removed ttype.h and
Message-Id: <20111104105446.GM4682@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="KSyhVCl2eeZHT0Rn"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAGkUK2vuPMf7zWpBJosZdJLnFHsMN0f=St8dvgmrOzcA0JrPHA@mail.gmail.com>
In-Reply-To: <CAGkUK2vuPMf7zWpBJosZdJLnFHsMN0f=St8dvgmrOzcA0JrPHA@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--KSyhVCl2eeZHT0Rn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2011 at 07:09:07AM -0300, Marcos Souza wrote:
> So, I forgot to include kernels janitors on theses patches, so, forwardin=
g...
>=20

These should go to what the get_maintainer.pl script says.

=2E/scripts/get_maintainer.pl -f drivers/staging/vt6656/wpa2.h

Don't include linux-kernel though, they don't care about white space
fixes.

Why are you removing the "ttype.h" include?  I'm not saying you're
wrong to do that, but you should explain that in the change log.  Is
the ttype.h file not needed anymore or something?

Also don't put "So, I forgot to include kernels janitors on theses
patches, so, forwarding..." in the changelog part of the email.  How
maintainers apply patches is that they save the raw text of the email
and then cat raw_email.txt | git am.  Those kind of comments should
go after the --- and before the diff where I've marked below.  git am
ignores the stuff there.

> Removed some old comments and removed ttype.h of the file.
>=20
> Signed-off-by: Marcos Paulo de Souza <marcos.mage@gmail.com>
> ---
  ^^^
Put extra comments here, below those three dashes.

>  typedef struct tagsPMKIDInfo {
> -    BYTE    abyBSSID[6];
> -    BYTE    abyPMKID[16];
> +	unsigned char abyBSSID[6];
> +	unsigned char abyPMKID[16];

It's not a big deal either way, but normally people would use "u8"
here.

regards,
dan carpenter



--KSyhVCl2eeZHT0Rn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOs8R1AAoJEOnZkXI/YHqR5CsQAI4RXpBiR4jMH/ydxTZGgq+O
t0t0nU4iRawMDcOFDFwfn/qb9m3oWk8aFq0B6VNiLYqPDaxOyeCM60ugUwBiSbAU
x22iv4wkScx5HGUTtjwfGoY9mXMJxU/eQeYotOIr+K4rd1Z0XQSPVVjHriCL6ePK
rlXBsZjHH5OuFcVm36XrE9a3A7v+neHwWMVeA9mEW/aEJMAPWnxyFijwigjzpOXp
9M3/oIYaFsgO+taSOlnaKWCknQHo8jHc+rd/6WJL1i9b8VEdBazmLYzR+nEAPU6o
WrgWy4JX3dZ321YoubxuB/+iDk2ARnrlBg00mB3nQ7WZCkisXwkFZu3o4IKgNIAr
uPXAcVVZWO07TcFTtTMMM5efnhblj2wMfzGUxz22QMePTp4/4S4XrO8gdkfWTpWi
D0tZErA9Ir8/GgQllRN1b8uh6Cu6F59R5HAZZfNntmNeeX/ssLVl1lSKzBKsshRJ
plvv2+MjduOL9SS9lJ345bKV8hd3kSFDeNmdnnd6/aXEtSsqHn6P2XiegXhu4ws0
4BxVl7yN8/ZRVGtOo+P6bAhfK/ZKBB1ABmXAxN2cREY+Fv+M8pDxvUNX4+c562el
lre8p0+yuY75+lzgIet7zOYa/EHTrX82ItdB/wtXCS+KsoY7F1pUr24cSl0tcm1p
jzZoox8BiKhf8lGJNbop
=pksK
-----END PGP SIGNATURE-----

--KSyhVCl2eeZHT0Rn--
