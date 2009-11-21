From: Julia Lawall <julia@diku.dk>
Date: Sat, 21 Nov 2009 15:53:16 +0000
Subject: [PATCH] fs/ceph: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0911211652550.26930@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@newdream.net>, ceph-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/).

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/ceph/osd_client.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -u -p a/fs/ceph/osd_client.c b/fs/ceph/osd_client.c
--- a/fs/ceph/osd_client.c
+++ b/fs/ceph/osd_client.c
@@ -1244,11 +1244,12 @@ int ceph_osdc_writepages(struct ceph_osd
 static void dispatch(struct ceph_connection *con, struct ceph_msg *msg)
 {
 	struct ceph_osd *osd = con->private;
-	struct ceph_osd_client *osdc = osd->o_osdc;
+	struct ceph_osd_client *osdc;
 	int type = le16_to_cpu(msg->hdr.type);
 
 	if (!osd)
 		return;
+	osdc = osd->o_osdc;
 
 	switch (type) {
 	case CEPH_MSG_OSD_MAP:
