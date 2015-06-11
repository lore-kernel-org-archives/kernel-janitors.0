From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 11 Jun 2015 12:02:57 +0000
Subject: [PATCH 6/7] lustre: obdclass: linux: Replace uses of OBD_{ALLOC,FREE}_LARGE
Message-Id: <1434024178-8785-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434024178-8785-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434024178-8785-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Replace uses of OBD_ALLOC_LARGE by libcfs_kvzalloc and OBD_FREE_LARGE by
kvfree.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ptr,size;
@@

- OBD_ALLOC_LARGE(ptr,size)
+ ptr = libcfs_kvzalloc(size, GFP_NOFS)

@@
expression ptr,size;
@@

- OBD_FREE_LARGE(ptr, size);
+ kvfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/linux/linux-module.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c b/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
index e3c6dcb..84f75dc 100644
--- a/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
+++ b/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
@@ -107,7 +107,7 @@ int obd_ioctl_getdata(char **buf, int *len, void *arg)
 	 * system, the high lock contention will hurt performance badly,
 	 * obdfilter-survey is an example, which relies on ioctl. So we'd
 	 * better avoid vmalloc on ioctl path. LU-66 */
-	OBD_ALLOC_LARGE(*buf, hdr.ioc_len);
+	*buf = libcfs_kvzalloc(hdr.ioc_len, GFP_NOFS);
 	if (*buf = NULL) {
 		CERROR("Cannot allocate control buffer of len %d\n",
 		       hdr.ioc_len);
@@ -153,7 +153,7 @@ int obd_ioctl_getdata(char **buf, int *len, void *arg)
 	return 0;
 
 free_buf:
-	OBD_FREE_LARGE(*buf, hdr.ioc_len);
+	kvfree(*buf);
 	return err;
 }
 EXPORT_SYMBOL(obd_ioctl_getdata);

