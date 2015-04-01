From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Apr 2015 08:12:15 +0000
Subject: [patch 1/2] Staging: lustre: integer overflow in ioctl
Message-Id: <20150401081215.GA21130@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hdr->ioc_len is a user controlled u32 so the addition can overflow,
especially on 32 bit systems.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c b/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c
index a5effcd..e962f89 100644
--- a/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c
+++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c
@@ -57,7 +57,7 @@ int libcfs_ioctl_getdata(char *buf, char *end, void *arg)
 		return -EINVAL;
 	}
 
-	if (hdr->ioc_len + buf >= end) {
+	if (hdr->ioc_len >= end - buf) {
 		CERROR("PORTALS: user buffer exceeds kernel buffer\n");
 		return -EINVAL;
 	}
