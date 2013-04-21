From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 21 Apr 2013 11:08:31 +0000
Subject: [patch] staging: dgrp: info leak in dgrp_dpa_ioctl()
Message-Id: <20130421110830.GC6171@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If "nd->nd_vpd_len" is less than 512 then the last part of the
"vpd.vpd_data" has uninitialized stack information.  We need to clear it
before copying the buffer to user space.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/dgrp/dgrp_dpa_ops.c b/drivers/staging/dgrp/dgrp_dpa_ops.c
index 43209c1..d99c227 100644
--- a/drivers/staging/dgrp/dgrp_dpa_ops.c
+++ b/drivers/staging/dgrp/dgrp_dpa_ops.c
@@ -408,6 +408,7 @@ static long dgrp_dpa_ioctl(struct file *file, unsigned int cmd,
 
 
 	case DIGI_GETVPD:
+		memset(&vpd, 0, sizeof(vpd));
 		if (nd->nd_vpd_len > 0) {
 			vpd.vpd_len = nd->nd_vpd_len;
 			memcpy(&vpd.vpd_data, &nd->nd_vpd, nd->nd_vpd_len);
