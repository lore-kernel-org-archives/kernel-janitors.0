From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 23 Jun 2015 18:19:33 +0000
Subject: Re: [patch -next] drm/radeon: missing break statement
Message-Id: <20150624041933.71f83cc7@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/azuQJ=8jkPsAccNxrpbzc/A"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150623115148.GA6302@mwanda>
In-Reply-To: <20150623115148.GA6302@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

--Sig_/azuQJ=8jkPsAccNxrpbzc/A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Tue, 23 Jun 2015 14:51:48 +0300 Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
>
> There was a merge problem in linux-next 4598d330d29e ('Merge
> remote-tracking branch 'drm/drm-next'').  We need to add a break
> statement.

Thanks for noticing.  I have fixed my merge resolution for the next
release and hopefully Linus will do it right when he merges the drm
tree (if it is still necessary).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/azuQJ=8jkPsAccNxrpbzc/A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJViaM6AAoJEMDTa8Ir7ZwVmz8P/2zFrb/u8hfw04cHH0HLZQeM
lo1QEOMQry59Uz4bJ33Xipud3zqUQbMMOxtl2fVyvY4ilhisRaSw94DpqgNPccX+
hKdBL48EwkwTvzH1B9JEVzKZ6s2RUu/MSAXorgIQAMcUn/Sx4eLCMP6/LNDmgVHw
8f0mRIklOuYd9wBfGq5gbCOpiCci7h2JLEAs2XNpogtRgCWpq+2JhzTJPyb2/g/k
WoQe9XZA2PP60I1w0a39gTUkfAEjkvjCfP4gbH+WRu3X+uMy/Q6+NEH4Wx6mzpVG
3uhjIP7xPyiuBirVSrkr00c1f6i1GLv9lhMVoo8jvG84fbR4zVjpzNuxKqyhky1Y
hVMp5XaKaNnVinAHP+haF9u5GthZsyRkIgKHge2uzzilrBtVgM3S9VH4sZ4Rv9jh
ym1ymsKQRxDGymy2+hbKTW7Z/nyvGPXwNgoehDM/Xwo5F1HjarWj9XWDXE3FZ6hp
qnkmjZFa2nDqcjqbEKdWivB/rL2CnyKz1cQfqi5vTH3lKxT/bmA+IO2bc7khU6hN
9laldL2dJTASp09FB9qPbrV67Uac+UwzBkYljOgF0Tzqe5d9oimVOPVq6GyCrtXg
BSiY3FP6gbHoBK2OOvPtzd0tTwaoqszX2sXkZo1NChtj1gWwTE0bqBqYn51GGNo5
Iodtdn/Qm16weDdVgzSP
=Rqfg
-----END PGP SIGNATURE-----

--Sig_/azuQJ=8jkPsAccNxrpbzc/A--
