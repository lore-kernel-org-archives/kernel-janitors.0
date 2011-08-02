From: Julia Lawall <julia@diku.dk>
Date: Tue, 02 Aug 2011 10:35:02 +0000
Subject: [PATCH 9/11] drivers/target/target_core_rd.c: trivial: use BUG_ON
Message-Id: <1312281304-11847-10-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use BUG_ON(x) rather than if(x) BUG();

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ identifier x; @@
-if (x) BUG();
+BUG_ON(x);

@@ identifier x; @@
-if (!x) BUG();
+BUG_ON(!x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/target/target_core_rd.c |   24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff -u -p a/drivers/target/target_core_rd.c b/drivers/target/target_core_rd.c
--- a/drivers/target/target_core_rd.c
+++ b/drivers/target/target_core_rd.c
@@ -390,12 +390,10 @@ static int rd_MEMCPY_read(struct rd_requ
 				length = req->rd_size;
 
 			dst = sg_virt(&sg_d[i++]) + dst_offset;
-			if (!dst)
-				BUG();
+			BUG_ON(!dst);
 
 			src = sg_virt(&sg_s[j]) + src_offset;
-			if (!src)
-				BUG();
+			BUG_ON(!src);
 
 			dst_offset = 0;
 			src_offset = length;
@@ -415,8 +413,7 @@ static int rd_MEMCPY_read(struct rd_requ
 				length = req->rd_size;
 
 			dst = sg_virt(&sg_d[i]) + dst_offset;
-			if (!dst)
-				BUG();
+			BUG_ON(!dst);
 
 			if (sg_d[i].length = length) {
 				i++;
@@ -425,8 +422,7 @@ static int rd_MEMCPY_read(struct rd_requ
 				dst_offset = length;
 
 			src = sg_virt(&sg_s[j++]) + src_offset;
-			if (!src)
-				BUG();
+			BUG_ON(!src);
 
 			src_offset = 0;
 			page_end = 1;
@@ -510,12 +506,10 @@ static int rd_MEMCPY_write(struct rd_req
 				length = req->rd_size;
 
 			src = sg_virt(&sg_s[i++]) + src_offset;
-			if (!src)
-				BUG();
+			BUG_ON(!src);
 
 			dst = sg_virt(&sg_d[j]) + dst_offset;
-			if (!dst)
-				BUG();
+			BUG_ON(!dst);
 
 			src_offset = 0;
 			dst_offset = length;
@@ -535,8 +529,7 @@ static int rd_MEMCPY_write(struct rd_req
 				length = req->rd_size;
 
 			src = sg_virt(&sg_s[i]) + src_offset;
-			if (!src)
-				BUG();
+			BUG_ON(!src);
 
 			if (sg_s[i].length = length) {
 				i++;
@@ -545,8 +538,7 @@ static int rd_MEMCPY_write(struct rd_req
 				src_offset = length;
 
 			dst = sg_virt(&sg_d[j++]) + dst_offset;
-			if (!dst)
-				BUG();
+			BUG_ON(!dst);
 
 			dst_offset = 0;
 			page_end = 1;

