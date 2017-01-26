From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 10:19:32 +0000
Subject: [PATCH 3/5] gtp: Adjust 12 checks for null pointers
Message-Id: <10c20387-4a38-726e-ea58-2a06d50239a5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <698070a4-e08e-78e5-0214-df69783cce22@users.sourceforge.net>
In-Reply-To: <698070a4-e08e-78e5-0214-df69783cce22@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netdev@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, "David S. Miller" <davem@davemloft.net>, Harald Welte <laforge@gnumonks.org>, Johannes Berg <johannes.berg@intel.com>, Pablo Neira <pablo@netfilter.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Jan 2017 22:50:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/gtp.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index f0c123101aa9..7e38786361d8 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -785,12 +785,12 @@ static int gtp_hashtable_new(struct gtp_dev *gtp, int=
 hsize)
=20
 	gtp->addr_hash =3D kmalloc_array(hsize, sizeof(*gtp->addr_hash),
 				       GFP_KERNEL);
-	if (gtp->addr_hash =3D NULL)
+	if (!gtp->addr_hash)
 		return -ENOMEM;
=20
 	gtp->tid_hash =3D kmalloc_array(hsize, sizeof(*gtp->tid_hash),
 				      GFP_KERNEL);
-	if (gtp->tid_hash =3D NULL)
+	if (!gtp->tid_hash)
 		goto err1;
=20
 	gtp->hash_size =3D hsize;
@@ -832,7 +832,7 @@ static int gtp_encap_enable(struct net_device *dev, str=
uct gtp_dev *gtp,
 	netdev_dbg(dev, "enable gtp on %d, %d\n", fd_gtp0, fd_gtp1);
=20
 	sock0 =3D sockfd_lookup(fd_gtp0, &err);
-	if (sock0 =3D NULL) {
+	if (!sock0) {
 		netdev_dbg(dev, "socket fd=3D%d not found (gtp0)\n", fd_gtp0);
 		return -ENOENT;
 	}
@@ -844,7 +844,7 @@ static int gtp_encap_enable(struct net_device *dev, str=
uct gtp_dev *gtp,
 	}
=20
 	sock1u =3D sockfd_lookup(fd_gtp1, &err);
-	if (sock1u =3D NULL) {
+	if (!sock1u) {
 		netdev_dbg(dev, "socket fd=3D%d not found (gtp1u)\n", fd_gtp1);
 		err =3D -ENOENT;
 		goto err1;
@@ -957,7 +957,7 @@ static int ipv4_pdp_add(struct net_device *dev, struct =
genl_info *info)
 	}
=20
 	pctx =3D kmalloc(sizeof(*pctx), GFP_KERNEL);
-	if (pctx =3D NULL)
+	if (!pctx)
 		return -ENOMEM;
=20
 	ipv4_pdp_fill(pctx, info);
@@ -1029,7 +1029,7 @@ static int gtp_genl_new_pdp(struct sk_buff *skb, stru=
ct genl_info *info)
=20
 	/* Check if there's an existing gtpX device to configure */
 	dev =3D gtp_find_dev(net, nla_get_u32(info->attrs[GTPA_LINK]));
-	if (dev =3D NULL) {
+	if (!dev) {
 		put_net(net);
 		return -ENODEV;
 	}
@@ -1055,7 +1055,7 @@ static int gtp_genl_del_pdp(struct sk_buff *skb, stru=
ct genl_info *info)
=20
 	/* Check if there's an existing gtpX device to configure */
 	dev =3D gtp_find_dev(net, nla_get_u32(info->attrs[GTPA_LINK]));
-	if (dev =3D NULL) {
+	if (!dev) {
 		put_net(net);
 		return -ENODEV;
 	}
@@ -1079,7 +1079,7 @@ static int gtp_genl_del_pdp(struct sk_buff *skb, stru=
ct genl_info *info)
 		return -EINVAL;
 	}
=20
-	if (pctx =3D NULL)
+	if (!pctx)
 		return -ENOENT;
=20
 	if (pctx->gtp_version =3D GTP_V0)
@@ -1105,7 +1105,7 @@ static int gtp_genl_fill_info(struct sk_buff *skb, u3=
2 snd_portid, u32 snd_seq,
=20
 	genlh =3D genlmsg_put(skb, snd_portid, snd_seq, &gtp_genl_family, 0,
 			    type);
-	if (genlh =3D NULL)
+	if (!genlh)
 		goto nlmsg_failure;
=20
 	if (nla_put_u32(skb, GTPA_VERSION, pctx->gtp_version) ||
@@ -1163,7 +1163,7 @@ static int gtp_genl_get_pdp(struct sk_buff *skb, stru=
ct genl_info *info)
=20
 	/* Check if there's an existing gtpX device to configure */
 	dev =3D gtp_find_dev(net, nla_get_u32(info->attrs[GTPA_LINK]));
-	if (dev =3D NULL) {
+	if (!dev) {
 		put_net(net);
 		return -ENODEV;
 	}
@@ -1188,13 +1188,13 @@ static int gtp_genl_get_pdp(struct sk_buff *skb, st=
ruct genl_info *info)
 		pctx =3D ipv4_pdp_find(gtp, ip);
 	}
=20
-	if (pctx =3D NULL) {
+	if (!pctx) {
 		err =3D -ENOENT;
 		goto err_unlock;
 	}
=20
 	skb2 =3D genlmsg_new(NLMSG_GOODSIZE, GFP_ATOMIC);
-	if (skb2 =3D NULL) {
+	if (!skb2) {
 		err =3D -ENOMEM;
 		goto err_unlock;
 	}
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
