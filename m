From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 15:26:35 +0000
Subject: [PATCH 4/10] drivers/net: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0907191726140.16542@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: eilong@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E,E1;
identifier i,fld;
statement S;
@@

- T i =3D E->fld;
+ T i;
  ... when !=3D E=E1
      when !=3D i
  if (E =3D NULL||...) S
+ i =3D E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/bnx2x_link.c            |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/net/bnx2x_link.c b/drivers/net/bnx2x_link.c
index ed648ac..2ee581a 100644
--- a/drivers/net/bnx2x_link.c
+++ b/drivers/net/bnx2x_link.c
@@ -4212,13 +4212,14 @@ static void bnx2x_turn_off_sf(struct bnx2x *bp, u8 =
port)
 u8 bnx2x_get_ext_phy_fw_version(struct link_params *params, u8 driver_load=
ed,
 			      u8 *version, u16 len)
 {
-	struct bnx2x *bp =3D params->bp;
+	struct bnx2x *bp;
 	u32 ext_phy_type =3D 0;
 	u32 spirom_ver =3D 0;
 	u8 status =3D 0 ;
=20
 	if (version =3D NULL || params =3D NULL)
 		return -EINVAL;
+	bp =3D params->bp;
=20
 	spirom_ver =3D REG_RD(bp, params->shmem_base +
 		   offsetof(struct shmem_region,
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
