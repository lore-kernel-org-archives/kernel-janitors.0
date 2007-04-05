From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Thu, 05 Apr 2007 14:56:20 +0000
Subject: [KJ] [PATCH]ROUND_UP macro cleanup in fs/smbfs/request.c
Message-Id: <20070405144420.GA10696@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070405142955.GA10638@arun.site>
In-Reply-To: <20070405142955.GA10638@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, Linux Filesystems <linux-fsdevel@vger.kernel.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org

ROUND_UP macro cleanup use ALIGN

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---

 request.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)


diff --git a/fs/smbfs/request.c b/fs/smbfs/request.c
index 723f7c6..c288fbe 100644
--- a/fs/smbfs/request.c
+++ b/fs/smbfs/request.c
@@ -6,6 +6,7 @@
  *  Please add a note about your changes to smbfs in the ChangeLog file.
  */
 
+#include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/fs.h>
 #include <linux/slab.h>
@@ -22,8 +23,6 @@
 /* #define SMB_SLAB_DEBUG	(SLAB_RED_ZONE | SLAB_POISON) */
 #define SMB_SLAB_DEBUG	0
 
-#define ROUND_UP(x) (((x)+3) & ~3)
-
 /* cache for request structures */
 static struct kmem_cache *req_cachep;
 
@@ -200,8 +199,8 @@ static int smb_setup_trans2request(struct smb_request *req)
 
 	const int smb_parameters = 15;
 	const int header = SMB_HEADER_LEN + 2 * smb_parameters + 2;
-	const int oparam = ROUND_UP(header + 3);
-	const int odata  = ROUND_UP(oparam + req->rq_lparm);
+	const int oparam = ALIGN(header + 3, sizeof(u32));
+	const int odata  = ALIGN(oparam + req->rq_lparm, sizeof(u32));
 	const int bcc = (req->rq_data ? odata + req->rq_ldata :
 					oparam + req->rq_lparm) - header;
 

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
