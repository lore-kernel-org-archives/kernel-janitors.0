From: NeilBrown <neilb@suse.de>
Date: Wed, 26 Sep 2012 01:52:56 +0000
Subject: Re: [md:for-next 32/33] drivers/md/raid5.c:2866:3: warning: format '%lu' expects argument of type 'l
Message-Id: <20120926115256.014f8f5c@notabene.brown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/wUt9ndDWZxP_pwFBSoBdxQK"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926013908.GE8522@localhost>
In-Reply-To: <20120926013908.GE8522@localhost>
To: kernel-janitors@vger.kernel.org

--Sig_/wUt9ndDWZxP_pwFBSoBdxQK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Sep 2012 09:39:08 +0800 Fengguang Wu <fengguang.wu@intel.com>
wrote:

> Hi Alexander,
>=20
> FYI, there are new compile warnings show up in
>=20
> tree:   git://neil.brown.name/md for-next
> head:   0179d361662367ab0f80b5822b162a1c0ba9b57d
> commit: eadb9fb1d4da32ed1b143a6fc1997c4c42ea0422 [32/33] md: When RAID5 i=
s dirty, force reconstruct-write instead of read-modify-write.
> config: m68k-allyesconfig
>=20
> All warnings:
>=20
> drivers/md/raid5.c: In function 'handle_stripe_dirtying':
> drivers/md/raid5.c:2866:3: warning: format '%lu' expects argument of type=
 'long unsigned int', but argument 4 has type 'sector_t' [-Wformat]
> drivers/md/raid5.c:2866:3: warning: format '%lu' expects argument of type=
 'long unsigned int', but argument 5 has type 'sector_t' [-Wformat]
>=20
> vim +2866 drivers/md/raid5.c
>   2850		sector_t recovery_cp =3D conf->mddev->recovery_cp;
>   2851=09
>   2852		/* RAID6 requires 'rcw' in current implementation.
>   2853		 * Otherwise, check whether resync is now happening or should sta=
rt.
>   2854		 * If yes, then the array is dirty (after unclean shutdown or
>   2855		 * initial creation), so parity in some stripes might be inconsis=
tent.
>   2856		 * In this case, we need to always do reconstruct-write, to ensure
>   2857		 * that in case of drive failure or read-error correction, we
>   2858		 * generate correct data from the parity.
>   2859		 */
>   2860		if (conf->max_degraded =3D=3D 2 ||
>   2861		    (recovery_cp < MaxSector && sh->sector >=3D recovery_cp)) {
>   2862			/* Calculate the real rcw later - for now make it
>   2863			 * look like rcw is cheaper
>   2864			 */
>   2865			rcw =3D 1; rmw =3D 2;
> > 2866			pr_debug("force RCW max_degraded=3D%u, recovery_cp=3D%lu sh->sec=
tor=3D%lu\n",
>   2867				 conf->max_degraded, recovery_cp, sh->sector);
>   2868		} else for (i =3D disks; i--; ) {
>   2869			/* would I have to read this buffer for read_modify_write */
>   2870			struct r5dev *dev =3D &sh->dev[i];
>   2871			if ((dev->towrite || i =3D=3D sh->pd_idx) &&
>   2872			    !test_bit(R5_LOCKED, &dev->flags) &&
>   2873			    !(test_bit(R5_UPTODATE, &dev->flags) ||
>   2874			      test_bit(R5_Wantcompute, &dev->flags))) {
>=20
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel Corporation


Thanks again!
I've fixed this up.

NeilBrown

--Sig_/wUt9ndDWZxP_pwFBSoBdxQK
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQIVAwUBUGJf+Dnsnt1WYoG5AQLjxxAAww7+4UKL2m4oe7k6Qeb/3j0xgGiCdxrE
L4vTrf+Ml7HYnZvGAlibqVBviyMDt1LWBuoV5aDz8o0CyRl1UjO5Yb88osLExr1+
AithFk3eVakPHIm7RHfDm6qxrQrUEmYVOQvI9QyKktsxm9ASrExUjmhn9uKhlR4D
deLT+QAMZpDnItQBa/1XPLhWge+PG0RthRw1fG6JvmMBpWs0mquQf18621pVfXoy
VrfCjdRExF4mAW15kdR9OqMFFuZ5NRkp1xlTQZ+yMnhea+xPD5V5aNGAAwl4jgs7
RrpxZgOC51PgK+xp95TjM1T1J9NIADmyyNlSRmZKaZj5znsMQ96c2grC/v9Dns1B
Mv5lI0B8+BbATgZhs0HPKKfKR/YlbkUjfDL0VwW/1fFIILOuBsBwWeZtpjhvcu5k
2RTmP3Y6dlN4sLdg/yQvnSyOrok+3Qh8o7F3cVfqOtBIBuX/KpxTwv6vn6T8gShD
KlpIHUYOcMltmmWt1AP3CHEHlb959Uukt7DOiXvN1pom1leI2A37+UgCQjGhjbRd
mUiu6f+fb1bSSb9XpuyJqJMMKX+PpNCz8D/sggTeNWpv4dLgQULn463RjpkzRBdx
3iif8bYluDk1sdXR3lARG6HaMEjYpxiBC7qRlo+Z4nqPqxXltmEoz8U0rayBtjAw
+/Q3GNm87wo=
=qV3d
-----END PGP SIGNATURE-----

--Sig_/wUt9ndDWZxP_pwFBSoBdxQK--
