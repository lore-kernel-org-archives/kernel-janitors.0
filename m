From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Oct 2015 11:19:01 +0000
Subject: [patch 2/2 v2] misc: mic/scif: fix wrap around tests
Message-Id: <20151019111901.GA29692@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Nikhil Rao <nikhil.rao@intel.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org

Signed integer overflow is undefined.  Also I added a check for
"(offset < 0)" in scif_unregister() because that makes it match the
other conditions and because I didn't want to subtract a negative.

Fixes: ba612aa8b487 ('misc: mic: SCIF memory registration and unregistration')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I reversed a condition in the first version of this patch.

diff --git a/drivers/misc/mic/scif/scif_rma.c b/drivers/misc/mic/scif/scif_rma.c
index bc2dccb..245ea9b 100644
--- a/drivers/misc/mic/scif/scif_rma.c
+++ b/drivers/misc/mic/scif/scif_rma.c
@@ -1510,7 +1510,7 @@ off_t scif_register_pinned_pages(scif_epd_t epd,
 	if ((map_flags & SCIF_MAP_FIXED) &&
 	    ((ALIGN(offset, PAGE_SIZE) != offset) ||
 	    (offset < 0) ||
-	    (offset + (off_t)len < offset)))
+	    (len > LONG_MAX - offset)))
 		return -EINVAL;
 
 	might_sleep();
@@ -1613,7 +1613,7 @@ off_t scif_register(scif_epd_t epd, void *addr, size_t len, off_t offset,
 	if ((map_flags & SCIF_MAP_FIXED) &&
 	    ((ALIGN(offset, PAGE_SIZE) != offset) ||
 	    (offset < 0) ||
-	    (offset + (off_t)len < offset)))
+	    (len > LONG_MAX - offset)))
 		return -EINVAL;
 
 	/* Unsupported protection requested */
@@ -1731,7 +1731,8 @@ scif_unregister(scif_epd_t epd, off_t offset, size_t len)
 
 	/* Offset is not page aligned or offset+len wraps around */
 	if ((ALIGN(offset, PAGE_SIZE) != offset) ||
-	    (offset + (off_t)len < offset))
+	    (offset < 0) ||
+	    (len > LONG_MAX - offset))
 		return -EINVAL;
 
 	err = scif_verify_epd(ep);
