From: NeilBrown <neilb@suse.de>
Date: Wed, 01 Aug 2012 21:17:49 +0000
Subject: Re: [md:for-next 18/18] dm-raid.c:(.text+0x11f6d5): undefined reference to `md_raid10_congested'
Message-Id: <20120802071749.50a7ea27@notabene.brown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_//=URJyxUqkdq7s5s1oNmQTe"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120801125102.GA19751@localhost>
In-Reply-To: <20120801125102.GA19751@localhost>
To: kernel-janitors@vger.kernel.org

--Sig_//=URJyxUqkdq7s5s1oNmQTe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Aug 2012 10:33:07 -0500 Brassow Jonathan <jbrassow@redhat.com>
wrote:

>=20
> On Aug 1, 2012, at 7:51 AM, Fengguang Wu wrote:
>=20
> > Hi Jonathan,
> >=20
> > Kernel build failed on
> >=20
> > tree:   git://neil.brown.name/md for-next
> > head:   63f33b8dda88923487004b20fba825486d009e7b
> > commit: 63f33b8dda88923487004b20fba825486d009e7b [18/18] DM RAID: Add s=
upport for MD RAID10
> > config: i386-randconfig-k016 (attached as .config)
> >=20
> > All related error/warning messages:
> >=20
> > drivers/built-in.o: In function `raid_is_congested':
> > dm-raid.c:(.text+0x11f6d5): undefined reference to `md_raid10_congested'
>=20
>=20
> Seems that the previous patches that this patch depends on are not applie=
d in your case.  Looking here:
> http://neil.brown.name/git?p=3Dmd;a=3Dshortlog;h=3Drefs/heads/for-next
> it seems that Neil has taken the prerequisites (in this case, "MD RAID10:=
 export md_raid10_congested").
>=20
>  brassow
We missed a bit:

config DM_RAID
       tristate "RAID 1/4/5/6 target"
       depends on BLK_DEV_DM
       select MD_RAID1
       select MD_RAID456
       select BLK_DEV_MD


we need to add=20
       select MD_RAID10
in there.

Thanks Fengguang!

NeilBrown

--Sig_//=URJyxUqkdq7s5s1oNmQTe
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQIVAwUBUBmc/Tnsnt1WYoG5AQJMCQ/9FcCOL7gHRfV65Ac13N4Z8U3evZDoctpo
/0BkcQUmecg8ovaukMw8eMg3eXOCu51x2CDT+i0BOQwO635wRLBjaprKpIpArmHw
7ilqT23Yz8YAW7aogGRcmm1qiQub2ARUV/jEyPa8vFVbPNbnvGqnWCt9TS9z8Ltv
KCTqvN6LLq+nFBsUxeExkBJJkc+lL7QFqAf3jXJVCHo7ix7iGsnRaz2+BnbDUKMB
8LJwlPkJLBuRjcm+5wxCG0VMCdndHTVliEgirWNc+OozFuiDnGivITRM0LeA1Wyg
SgBvNXgoVpctdg/6lfZ2Fd3GNuO65Rmxqv74cgUS5iSi/bDWW7a/aF96N8o2Xf9k
KN9rYgYkSftEY3R0jQLzRqTKuBwyel6yqdE5Bie7XuDvaE0VLf/0WHiBwF18RDW3
Y1dAWZqVyB4UWMXMSNpQt6zaUoMR7CIzFPm3yKU8GjT4WRvuBf+OGq00GJUXwXXF
fg0GekUmMnrpK5Rvfq9H2/blld8ux8waBE3wJOARhzzijoKwYYrqWZwF65unmHWV
SxYFRegzHXqwNgkRIdPkXVcGZqhGmNtMIN5fDOoFBSyZZp8ae68IuYZYt1F5599P
/Ew4QXFuZd8kRDyMMJhiQ0qm/YrdLDQsBErvTMylljUzu+fJgGch3aISK3xeyBx7
6FoXuCOLyXc=
=q50a
-----END PGP SIGNATURE-----

--Sig_//=URJyxUqkdq7s5s1oNmQTe--
