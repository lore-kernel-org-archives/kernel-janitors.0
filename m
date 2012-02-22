From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Feb 2012 16:37:21 +0000
Subject: Re: [patch] Btrfs: silence a compiler warning
Message-Id: <20120222163721.GB4096@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="/NkBOFFp2J2Af1nK"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120222073055.GB7389@elgon.mountain>
 <20120222162926.GA25392@davidb.org>
In-Reply-To: <20120222162926.GA25392@davidb.org>
To: David Brown <davidb@davidb.org>
Cc: Chris Mason <chris.mason@oracle.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 08:29:26AM -0800, David Brown wrote:
> On Wed, Feb 22, 2012 at 10:30:55AM +0300, Dan Carpenter wrote:
> >Gcc warns that "ret" can be used uninitialized.  It can't actually be
> >used uninitialized because btrfs_num_copies() always returns 1 or more.
> >
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> >diff --git a/fs/btrfs/check-integrity.c b/fs/btrfs/check-integrity.c
> >index 064b29b..c053e90 100644
> >--- a/fs/btrfs/check-integrity.c
> >+++ b/fs/btrfs/check-integrity.c
> >@@ -643,7 +643,7 @@ static struct btrfsic_dev_state *btrfsic_dev_state_h=
ashtable_lookup(
> >static int btrfsic_process_superblock(struct btrfsic_state *state,
> >				      struct btrfs_fs_devices *fs_devices)
> >{
> >-	int ret;
> >+	int ret =3D 0;
>=20
> Does
>=20
> 	int uninitialized_var(ret);
>=20
> work?  The assignment to zero actually generates additional
> (unnecessary) code.

Sure.  I can resend it.

regards,
dan carpenter


--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPRRnBAAoJEOnZkXI/YHqRtT4P/R3BPLC+lk201GHIMpMHpFSX
orL83AAERee6Pa0LahyG911pCKGURiIvaZwQ7AqpQPkmZlLEZmCZKL9/47mNqx2h
HkXQc1pACBLVitkBiJVHKl9jl1ZdLaqz8ZQljsDyU7ZJ+9HWQwRrZSOerPAT4Rwd
5MGFpOGAHlKSu5miyNVlh7IMVW+vY64g0Qncgzv8mpPQ9OsuW3c+UEZKull3WlFV
JdeBhi83U3wUyx32gm9ZzHVbeeLyMHdv5haTB2FfFEECJJaNRJWJmtfcWm6CsUia
LCZ8oZCwQsRGLSkbuMkrZcTx6oWC2mnJTat5QPdpNe89WXtmweW8r2t0gZKsLfjr
6EMImD+U95wdRSez7rx8+TVAE4rhxbOMy+4LDGhdeeuZm1BES3BR5iqazvLp2b0F
94gnw3UNcFM/yTI365Td4MbQQDPSlxh2QcHDyAgSQ30dQi0PhLs/qLQbGYXH/feu
OKYmi7OSGml28z90NL2TN1SxA8dYp/BuGH6CfkRy5LFC/b15bRPdIXYg4islqVmE
3Itv4aWo0CBu7wdF1UBQNMGzYYebfUImhQFC4I7keL0KSiW465ysKj99DBApmOXP
OUQvssmj9XhJ1H3aquDkAOOAYoKUqqUEuYY0aLJgHcSdAERFekkAVMHhNG0VOIjl
fx7VKrunqanMyY3XeFhu
=8HqD
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
