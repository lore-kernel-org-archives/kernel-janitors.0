From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 28 Apr 2020 03:47:36 +0000
Subject: [PATCH -next] ipc: use GFP_ATOMIC under spin lock
Message-Id: <20200428034736.27850-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Waiman Long <longman@redhat.com>, Manfred Spraul <manfred@colorfullife.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Dobriyan <adobriyan@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The function ipc_id_alloc() is called from ipc_addid(), in which
a spin lock is held, so we should use GFP_ATOMIC instead.

Fixes: de5738d1c364 ("ipc: convert ipcs_idr to XArray")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 ipc/util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ipc/util.c b/ipc/util.c
index 723dc4b05208..093b31993d39 100644
--- a/ipc/util.c
+++ b/ipc/util.c
@@ -241,7 +241,7 @@ static inline int ipc_id_alloc(struct ipc_ids *ids, struct kern_ipc_perm *new)
 					xas.xa_index;
 			xas_store(&xas, new);
 			xas_clear_mark(&xas, XA_FREE_MARK);
-		} while (__xas_nomem(&xas, GFP_KERNEL));
+		} while (__xas_nomem(&xas, GFP_ATOMIC));
 
 		xas_unlock(&xas);
 		err = xas_error(&xas);
@@ -250,7 +250,7 @@ static inline int ipc_id_alloc(struct ipc_ids *ids, struct kern_ipc_perm *new)
 		new->id = get_restore_id(ids);
 		new->seq = ipcid_to_seqx(new->id);
 		idx = ipcid_to_idx(new->id);
-		err = xa_insert(&ids->ipcs, idx, new, GFP_KERNEL);
+		err = xa_insert(&ids->ipcs, idx, new, GFP_ATOMIC);
 		if (err = -EBUSY)
 			err = -ENOSPC;
 		set_restore_id(ids, -1);
