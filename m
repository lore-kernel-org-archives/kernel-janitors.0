From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 15:25:28 +0000
Subject: [PATCH 1/10] arch/arm/plat-omap: Drop unnecessary NULL test
Message-Id: <Pine.LNX.4.64.0907191725060.16542@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: tony@atomide.com, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The function map_iovm_area is static and is only called from one place, at
which the "new" argument cannot be NULL.

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
 arch/arm/plat-omap/iovmm.c          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-omap/iovmm.c b/arch/arm/plat-omap/iovmm.c
index 2fce2c1..04e2286 100644
--- a/arch/arm/plat-omap/iovmm.c
+++ b/arch/arm/plat-omap/iovmm.c
@@ -447,7 +447,7 @@ static int map_iovm_area(struct iommu *obj, struct iovm=
_struct *new,
 	struct scatterlist *sg;
 	u32 da =3D new->da_start;
=20
-	if (!obj || !new || !sgt)
+	if (!obj || !sgt)
 		return -EINVAL;
=20
 	BUG_ON(!sgtable_ok(sgt));
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
