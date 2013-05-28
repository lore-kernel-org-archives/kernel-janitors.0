From: Emil Goode <emilgoode@gmail.com>
Date: Tue, 28 May 2013 14:59:00 +0000
Subject: [PATCH] ceph: improve error handling in ceph_mdsmap_decode
Message-Id: <1369753140-28802-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sage@inktank.com
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

This patch makes the following improvements to the error handling
in the ceph_mdsmap_decode function:

- Add a NULL check for return value from kcalloc
- Make use of the variable err

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 fs/ceph/mdsmap.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ceph/mdsmap.c b/fs/ceph/mdsmap.c
index 9278dec..d4d3897 100644
--- a/fs/ceph/mdsmap.c
+++ b/fs/ceph/mdsmap.c
@@ -138,6 +138,8 @@ struct ceph_mdsmap *ceph_mdsmap_decode(void **p, void *end)
 				m->m_info[mds].export_targets  					kcalloc(num_export_targets, sizeof(u32),
 						GFP_NOFS);
+				if (m->m_info[mds].export_targets = NULL)
+					goto badmem;
 				for (j = 0; j < num_export_targets; j++)
 					m->m_info[mds].export_targets[j]  					       ceph_decode_32(&pexport_targets);
@@ -170,7 +172,7 @@ bad:
 		       DUMP_PREFIX_OFFSET, 16, 1,
 		       start, end - start, true);
 	ceph_mdsmap_destroy(m);
-	return ERR_PTR(-EINVAL);
+	return ERR_PTR(err);
 }
 
 void ceph_mdsmap_destroy(struct ceph_mdsmap *m)
-- 
1.7.10.4

