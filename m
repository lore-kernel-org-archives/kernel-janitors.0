From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 23 Sep 2018 09:05:49 +0000
Subject: Re: [PATCH -next] powerpc: Remove duplicated include from pci_32.c
Message-Id: <20180923190549.1de60304@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/WWIZE=ZAavuz4SP_FRcygZC"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537690328-77353-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537690328-77353-1-git-send-email-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Al Viro <viro@zeniv.linux.org.uk>, Paul Burton <paul.burton@mips.com>, Sinan Kaya <okaya@codeaurora.org>, Mathieu Malaterre <malat@debian.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--Sig_/WWIZE=ZAavuz4SP_FRcygZC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi YueHaibing,

On Sun, 23 Sep 2018 08:12:08 +0000 YueHaibing <yuehaibing@huawei.com> wrote:
>
> Remove duplicated include.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Good catch.  It was added by 2 separate commits in v4.18-rc1.

Reviewed-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/WWIZE=ZAavuz4SP_FRcygZC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlunV20ACgkQAVBC80lX
0GyHRQgAh2paAZg1pxKRLibvX6qiQV5EDyFHpjlyVlAoTJBHVrVLkGnci+r9Uaaz
HoY4az0poqh7jkKTpGj2WeoJKPvPmDk+KYSMGTZLdVxT+N8f3Y8djaUeBcq7dxpY
20xOoSJJsFxr8sCG3ey2+UE7PPKRuQRC1G0DmWX0F161tzBJ6HO+dFHC3NsD2EXG
Os2MGl0fIdttT+C258QBS9JfzjIVZd7p/9foXsC2GCPGMVqMQHfIC8rXpYfQpsf5
/NJ+pr2M9IN7YVwleQ/9L/ZpliQCjJ3eI4uvCi/5IBPdk4hxhkwH1I151W7rl7cF
euT0y+MzpttSOQCK9HfLTMIBoE1iSA==
=EiDL
-----END PGP SIGNATURE-----

--Sig_/WWIZE=ZAavuz4SP_FRcygZC--
