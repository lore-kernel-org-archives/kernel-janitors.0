From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 11 Jun 2015 12:02:56 +0000
Subject: [PATCH 5/7] lustre: obdclass: Replace uses of OBD_{ALLOC,FREE}_LARGE
Message-Id: <1434024178-8785-6-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/obdclass/lu_object.c      |    8 ++++----
 drivers/staging/lustre/lustre/obdclass/lustre_handles.c |    5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/lustre_handles.c b/drivers/staging/lustre/lustre/obdclass/lustre_handles.c
index 1cfaabf..35a94a8 100644
--- a/drivers/staging/lustre/lustre/obdclass/lustre_handles.c
+++ b/drivers/staging/lustre/lustre/obdclass/lustre_handles.c
@@ -198,7 +198,8 @@ int class_handle_init(void)
 
 	LASSERT(handle_hash = NULL);
 
-	OBD_ALLOC_LARGE(handle_hash, sizeof(*bucket) * HANDLE_HASH_SIZE);
+	handle_hash = libcfs_kvzalloc(sizeof(*bucket) * HANDLE_HASH_SIZE,
+				      GFP_NOFS);
 	if (handle_hash = NULL)
 		return -ENOMEM;
 
@@ -249,7 +250,7 @@ void class_handle_cleanup(void)
 
 	count = cleanup_all_handles();
 
-	OBD_FREE_LARGE(handle_hash, sizeof(*handle_hash) * HANDLE_HASH_SIZE);
+	kvfree(handle_hash);
 	handle_hash = NULL;
 
 	if (count != 0)
diff --git a/drivers/staging/lustre/lustre/obdclass/lu_object.c b/drivers/staging/lustre/lustre/obdclass/lu_object.c
index eae6606..4d9b633 100644
--- a/drivers/staging/lustre/lustre/obdclass/lu_object.c
+++ b/drivers/staging/lustre/lustre/obdclass/lu_object.c
@@ -2121,7 +2121,7 @@ void lu_buf_free(struct lu_buf *buf)
 	LASSERT(buf);
 	if (buf->lb_buf) {
 		LASSERT(buf->lb_len > 0);
-		OBD_FREE_LARGE(buf->lb_buf, buf->lb_len);
+		kvfree(buf->lb_buf);
 		buf->lb_buf = NULL;
 		buf->lb_len = 0;
 	}
@@ -2133,7 +2133,7 @@ void lu_buf_alloc(struct lu_buf *buf, int size)
 	LASSERT(buf);
 	LASSERT(buf->lb_buf = NULL);
 	LASSERT(buf->lb_len = 0);
-	OBD_ALLOC_LARGE(buf->lb_buf, size);
+	buf->lb_buf = libcfs_kvzalloc(size, GFP_NOFS);
 	if (likely(buf->lb_buf))
 		buf->lb_len = size;
 }
@@ -2171,14 +2171,14 @@ int lu_buf_check_and_grow(struct lu_buf *buf, int len)
 	if (len <= buf->lb_len)
 		return 0;
 
-	OBD_ALLOC_LARGE(ptr, len);
+	ptr = libcfs_kvzalloc(len, GFP_NOFS);
 	if (ptr = NULL)
 		return -ENOMEM;
 
 	/* Free the old buf */
 	if (buf->lb_buf != NULL) {
 		memcpy(ptr, buf->lb_buf, buf->lb_len);
-		OBD_FREE_LARGE(buf->lb_buf, buf->lb_len);
+		kvfree(buf->lb_buf);
 	}
 
 	buf->lb_buf = ptr;

