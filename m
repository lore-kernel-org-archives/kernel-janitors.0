From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 16:13:04 +0000
Subject: [PATCH 10/10, corrected diffstat] drivers/net: Move a dereference
Message-Id: <Pine.LNX.4.64.0907191812010.16542@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereferences should be moved below
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
  BUG_ON (E =3D NULL||...);
+ i =3D E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/ibm_newemac/rgmii.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ibm_newemac/rgmii.c b/drivers/net/ibm_newemac/rgmi=
i.c
index 1d5379d..8d76cb8 100644
--- a/drivers/net/ibm_newemac/rgmii.c
+++ b/drivers/net/ibm_newemac/rgmii.c
@@ -188,11 +188,12 @@ void rgmii_put_mdio(struct of_device *ofdev, int inpu=
t)
 void rgmii_detach(struct of_device *ofdev, int input)
 {
 	struct rgmii_instance *dev =3D dev_get_drvdata(&ofdev->dev);
-	struct rgmii_regs __iomem *p =3D dev->base;
-
-	mutex_lock(&dev->lock);
+	struct rgmii_regs __iomem *p;
=20
 	BUG_ON(!dev || dev->users =3D 0);
+	p =3D dev->base;
+
+	mutex_lock(&dev->lock);
=20
 	RGMII_DBG(dev, "detach(%d)" NL, input);
=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
