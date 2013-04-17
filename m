From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 17 Apr 2013 07:19:05 +0000
Subject: [patch] [SCSI] libosd: remover duplicate __bitwise annotation
Message-Id: <20130417071905.GE7923@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boaz Harrosh <bharrosh@panasas.com>
Cc: Benny Halevy <bhalevy@tonian.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, osd-dev@open-osd.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

__be32 is already a __bitwise type so we don't need the second __bitwise
here.  It causes a Sparse error:
include/scsi/osd_protocol.h:110:26: error: invalid modifier

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/scsi/osd_protocol.h b/include/scsi/osd_protocol.h
index a6026da..25ac628 100644
--- a/include/scsi/osd_protocol.h
+++ b/include/scsi/osd_protocol.h
@@ -107,7 +107,7 @@ enum osd_attributes_mode {
  *		int exponent: 04;
  *	}
  */
-typedef __be32 __bitwise osd_cdb_offset;
+typedef __be32 osd_cdb_offset;
 
 enum {
 	OSD_OFFSET_UNUSED = 0xFFFFFFFF,
