From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:22:46 +0000
Subject: [PATCH 10/10] firewire-net: Adjust checks for null pointers in five functions
Message-Id: <99ff298b-0caa-9f47-d7db-57b6fbd69360@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
In-Reply-To: <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 07:48:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" can point information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/net.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index eb7ce5e..e313be3 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -366,13 +366,13 @@ static struct fwnet_partial_datagram *fwnet_pd_new(st=
ruct net_device *net,
=20
 	INIT_LIST_HEAD(&new->fi_list);
 	fi =3D fwnet_frag_new(new, frag_off, frag_len);
-	if (fi =3D NULL)
+	if (!fi)
 		goto free_new;
=20
 	new->datagram_label =3D datagram_label;
 	new->datagram_size =3D dg_size;
 	new->skb =3D dev_alloc_skb(dg_size + LL_RESERVED_SPACE(net));
-	if (new->skb =3D NULL)
+	if (!new->skb)
 		goto free_fragment_info;
=20
 	skb_reserve(new->skb, LL_RESERVED_SPACE(net));
@@ -418,7 +418,7 @@ static bool fwnet_pd_update(struct fwnet_peer *peer,
 		struct fwnet_partial_datagram *pd, void *frag_buf,
 		unsigned frag_off, unsigned frag_len)
 {
-	if (fwnet_frag_new(pd, frag_off, frag_len) =3D NULL)
+	if (!fwnet_frag_new(pd, frag_off, frag_len))
 		return false;
=20
 	memcpy(pd->pbuf + frag_off, frag_buf, frag_len);
@@ -623,7 +623,7 @@ static int fwnet_incoming_packet(struct fwnet_device *d=
ev, __be32 *buf, int len,
 	}
=20
 	pd =3D fwnet_pd_find(peer, datagram_label);
-	if (pd =3D NULL) {
+	if (!pd) {
 		while (peer->pdg_size >=3D FWNET_MAX_FRAGMENTS) {
 			/* remove the oldest */
 			fwnet_pd_delete(list_first_entry(&peer->pd_list,
@@ -632,7 +632,7 @@ static int fwnet_incoming_packet(struct fwnet_device *d=
ev, __be32 *buf, int len,
 		}
 		pd =3D fwnet_pd_new(net, peer, datagram_label,
 				  dg_size, buf, fg_off, len);
-		if (pd =3D NULL) {
+		if (!pd) {
 			retval =3D -ENOMEM;
 			goto unlock;
 		}
@@ -647,7 +647,7 @@ static int fwnet_incoming_packet(struct fwnet_device *d=
ev, __be32 *buf, int len,
 			fwnet_pd_delete(pd);
 			pd =3D fwnet_pd_new(net, peer, datagram_label,
 					  dg_size, buf, fg_off, len);
-			if (pd =3D NULL) {
+			if (!pd) {
 				peer->pdg_size--;
 				retval =3D -ENOMEM;
 				goto unlock;
@@ -1229,7 +1229,7 @@ static netdev_tx_t fwnet_tx(struct sk_buff *skb, stru=
ct net_device *net)
 	}
=20
 	ptask =3D kmem_cache_alloc(fwnet_packet_task_cache, GFP_ATOMIC);
-	if (ptask =3D NULL)
+	if (!ptask)
 		goto unlock;
=20
 	skb =3D skb_share_check(skb, GFP_ATOMIC);
@@ -1443,7 +1443,7 @@ static int fwnet_probe(struct fw_unit *unit,
=20
 	net =3D alloc_netdev(sizeof(*dev), "firewire%d", NET_NAME_UNKNOWN,
 			   fwnet_init_dev);
-	if (net =3D NULL) {
+	if (!net) {
 		mutex_unlock(&fwnet_device_mutex);
 		return -ENOMEM;
 	}
--=20
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
