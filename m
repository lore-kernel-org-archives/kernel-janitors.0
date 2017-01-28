From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 28 Jan 2017 09:36:28 +0000
Subject: [PATCH 3/4] dcbnl: Adjust five checks for null pointers
Message-Id: <72caef1b-f525-2942-4c29-ea2976157ad6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ab981a3f-e73e-9bef-09c5-9c6d077aef00@users.sourceforge.net>
In-Reply-To: <ab981a3f-e73e-9bef-09c5-9c6d077aef00@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Pan Bian <bianpan2016@163.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 28 Jan 2017 09:56:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/dcb/dcbnl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/dcb/dcbnl.c b/net/dcb/dcbnl.c
index f29e19d962ec..0903081a1212 100644
--- a/net/dcb/dcbnl.c
+++ b/net/dcb/dcbnl.c
@@ -398,7 +398,7 @@ static int dcbnl_setnumtcs(struct net_device *netdev, s=
truct nlmsghdr *nlh,
 		return ret;
=20
 	for (i =3D DCB_NUMTCS_ATTR_ALL+1; i <=3D DCB_NUMTCS_ATTR_MAX; i++) {
-		if (data[i] =3D NULL)
+		if (!data[i])
 			continue;
=20
 		value =3D nla_get_u8(data[i]);
@@ -741,7 +741,7 @@ static int dcbnl_setpfccfg(struct net_device *netdev, s=
truct nlmsghdr *nlh,
 		return ret;
=20
 	for (i =3D DCB_PFC_UP_ATTR_0; i <=3D DCB_PFC_UP_ATTR_7; i++) {
-		if (data[i] =3D NULL)
+		if (!data[i])
 			continue;
 		value =3D nla_get_u8(data[i]);
 		netdev->dcbnl_ops->setpfccfg(netdev,
@@ -955,7 +955,7 @@ static int dcbnl_bcn_setcfg(struct net_device *netdev, =
struct nlmsghdr *nlh,
 		return ret;
=20
 	for (i =3D DCB_BCN_ATTR_RP_0; i <=3D DCB_BCN_ATTR_RP_7; i++) {
-		if (data[i] =3D NULL)
+		if (!data[i])
 			continue;
 		value_byte =3D nla_get_u8(data[i]);
 		netdev->dcbnl_ops->setbcnrp(netdev,
@@ -963,7 +963,7 @@ static int dcbnl_bcn_setcfg(struct net_device *netdev, =
struct nlmsghdr *nlh,
 	}
=20
 	for (i =3D DCB_BCN_ATTR_BCNA_0; i <=3D DCB_BCN_ATTR_RI; i++) {
-		if (data[i] =3D NULL)
+		if (!data[i])
 			continue;
 		value_int =3D nla_get_u32(data[i]);
 		netdev->dcbnl_ops->setbcncfg(netdev,
@@ -1632,7 +1632,7 @@ static int dcbnl_setfeatcfg(struct net_device *netdev=
, struct nlmsghdr *nlh,
 		goto err;
=20
 	for (i =3D DCB_FEATCFG_ATTR_ALL+1; i <=3D DCB_FEATCFG_ATTR_MAX; i++) {
-		if (data[i] =3D NULL)
+		if (!data[i])
 			continue;
=20
 		value =3D nla_get_u8(data[i]);
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
