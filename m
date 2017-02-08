From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Feb 2017 21:17:42 +0000
Subject: [PATCH 07/14] RDMA/cxgb4: Adjust three checks for null pointers
Message-Id: <14a380a4-2aa3-b2cc-3207-99e86b5964ea@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0aff92fa-2891-333a-2e1e-ca309db2ec72@users.sourceforge.net>
In-Reply-To: <0aff92fa-2891-333a-2e1e-ca309db2ec72@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>, Steve Wise <swise@chelsio.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Feb 2017 17:10:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/cxgb4/device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/cxgb4/device.c b/drivers/infiniband/hw/c=
xgb4/device.c
index 90fa96abb5bc..7f30bfd71eb2 100644
--- a/drivers/infiniband/hw/cxgb4/device.c
+++ b/drivers/infiniband/hw/cxgb4/device.c
@@ -1126,10 +1126,10 @@ static inline int recv_rx_pkt(struct c4iw_dev *dev,=
 const struct pkt_gl *gl,
 		goto out;
=20
 	skb =3D copy_gl_to_skb_pkt(gl , rsp, dev->rdev.lldi.sge_pktshift);
-	if (skb =3D NULL)
+	if (!skb)
 		goto out;
=20
-	if (c4iw_handlers[opcode] =3D NULL) {
+	if (!c4iw_handlers[opcode]) {
 		pr_info("%s no handler opcode 0x%x...\n", __func__,
 		       opcode);
 		kfree_skb(skb);
@@ -1149,7 +1149,7 @@ static int c4iw_uld_rx_handler(void *handle, const __=
be64 *rsp,
 	struct sk_buff *skb;
 	u8 opcode;
=20
-	if (gl =3D NULL) {
+	if (!gl) {
 		/* omit RSS and rsp_ctrl at end of descriptor */
 		unsigned int len =3D 64 - sizeof(struct rsp_ctrl) - 8;
=20
--=20
2.11.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
