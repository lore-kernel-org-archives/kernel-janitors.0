From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 02 May 2015 21:16:48 +0000
Subject: [PATCH] staging: lustre: obd_support: Add obd_cpt_alloc function
Message-Id: <1430601408-12847-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Summarize OBD_CPT_ALLOC_GFP, OBD_CPT_ALLOC, and OBD_CPT_ALLOC_PTR as a
function, obd_cpt_alloc.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

Some questions: Is the name OK?  Is the NULL test needed?  If not, should
the call to kzalloc_node with the call to cfs_cpt_spread_node just be
inlined into the call sites?

 drivers/staging/lustre/lustre/include/obd_support.h |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/lustre/lustre/include/obd_support.h b/drivers/staging/lustre/lustre/include/obd_support.h
index 2991d2e..3d380f0 100644
--- a/drivers/staging/lustre/lustre/include/obd_support.h
+++ b/drivers/staging/lustre/lustre/include/obd_support.h
@@ -655,6 +655,15 @@ do {									      \
 #define OBD_CPT_ALLOC_PTR(ptr, cptab, cpt)				      \
 	OBD_CPT_ALLOC(ptr, cptab, cpt, sizeof(*(ptr)))
 
+static inline void *obd_cpt_alloc(struct cfs_cpt_table *cptab, int cpt,
+				  size_t size, gfp_t flags)
+{
+	return (cptab) = NULL ?
+		kzalloc(size, flags) :
+		kzalloc_node(size, flags, cfs_cpt_spread_node(cptab, cpt));
+}
+
+
 # define __OBD_VMALLOC_VEROBSE(ptr, cptab, cpt, size)			      \
 do {									      \
 	(ptr) = cptab = NULL ?						      \

