From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 11 Jun 2015 12:02:55 +0000
Subject: [PATCH 4/7] lustre: mdc: Replace uses of OBD_{ALLOC,FREE}_LARGE
Message-Id: <1434024178-8785-5-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/mdc/mdc_locks.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/mdc/mdc_locks.c b/drivers/staging/lustre/lustre/mdc/mdc_locks.c
index f935797..bcb6c00 100644
--- a/drivers/staging/lustre/lustre/mdc/mdc_locks.c
+++ b/drivers/staging/lustre/lustre/mdc/mdc_locks.c
@@ -746,7 +746,7 @@ static int mdc_finish_enqueue(struct obd_export *exp,
 		LDLM_DEBUG(lock, "layout lock returned by: %s, lvb_len: %d\n",
 			ldlm_it2str(it->it_op), lvb_len);
 
-		OBD_ALLOC_LARGE(lmm, lvb_len);
+		lmm = libcfs_kvzalloc(lvb_len, GFP_NOFS);
 		if (lmm = NULL) {
 			LDLM_LOCK_PUT(lock);
 			return -ENOMEM;
@@ -763,7 +763,7 @@ static int mdc_finish_enqueue(struct obd_export *exp,
 		}
 		unlock_res_and_lock(lock);
 		if (lmm != NULL)
-			OBD_FREE_LARGE(lmm, lvb_len);
+			kvfree(lmm);
 	}
 	if (lock != NULL)
 		LDLM_LOCK_PUT(lock);

