From: Vasiliy Kulikov <segoon@openwall.com>
Date: Sun, 14 Nov 2010 20:08:39 +0000
Subject: [PATCH] fs: jffs2: fix error value sign
Message-Id: <1289765320-6071-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

do_verify_xattr_datum(), do_load_xattr_datum(), load_xattr_datum()
and verify_xattr_ref() should return negative value on error.
Sometimes they return EIO that is positive.  Change this to -EIO.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 This driver is not compilable, so the patch is not tested.

 fs/jffs2/xattr.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 9b572ca..4f9cc04 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -151,7 +151,7 @@ static int do_verify_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_dat
 		JFFS2_ERROR("node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
 			    offset, je32_to_cpu(rx.hdr_crc), crc);
 		xd->flags |= JFFS2_XFLAGS_INVALID;
-		return EIO;
+		return -EIO;
 	}
 	totlen = PAD(sizeof(rx) + rx.name_len + 1 + je16_to_cpu(rx.value_len));
 	if (je16_to_cpu(rx.magic) != JFFS2_MAGIC_BITMASK
@@ -167,7 +167,7 @@ static int do_verify_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_dat
 			    je32_to_cpu(rx.xid), xd->xid,
 			    je32_to_cpu(rx.version), xd->version);
 		xd->flags |= JFFS2_XFLAGS_INVALID;
-		return EIO;
+		return -EIO;
 	}
 	xd->xprefix = rx.xprefix;
 	xd->name_len = rx.name_len;
@@ -230,7 +230,7 @@ static int do_load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum
 			      ref_offset(xd->node), xd->data_crc, crc);
 		kfree(data);
 		xd->flags |= JFFS2_XFLAGS_INVALID;
-		return EIO;
+		return -EIO;
 	}
 
 	xd->flags |= JFFS2_XFLAGS_HOT;
@@ -268,7 +268,7 @@ static int load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *x
 	if (xd->xname)
 		return 0;
 	if (xd->flags & JFFS2_XFLAGS_INVALID)
-		return EIO;
+		return -EIO;
 	if (unlikely(is_xattr_datum_unchecked(c, xd)))
 		rc = do_verify_xattr_datum(c, xd);
 	if (!rc)
@@ -460,7 +460,7 @@ static int verify_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref
 	if (crc != je32_to_cpu(rr.node_crc)) {
 		JFFS2_ERROR("node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
 			    offset, je32_to_cpu(rr.node_crc), crc);
-		return EIO;
+		return -EIO;
 	}
 	if (je16_to_cpu(rr.magic) != JFFS2_MAGIC_BITMASK
 	    || je16_to_cpu(rr.nodetype) != JFFS2_NODETYPE_XREF
@@ -470,7 +470,7 @@ static int verify_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref
 			    offset, je16_to_cpu(rr.magic), JFFS2_MAGIC_BITMASK,
 			    je16_to_cpu(rr.nodetype), JFFS2_NODETYPE_XREF,
 			    je32_to_cpu(rr.totlen), PAD(sizeof(rr)));
-		return EIO;
+		return -EIO;
 	}
 	ref->ino = je32_to_cpu(rr.ino);
 	ref->xid = je32_to_cpu(rr.xid);
-- 
1.7.0.4

