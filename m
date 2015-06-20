From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:03 +0000
Subject: [PATCH 05/12] staging: lustre: lmv: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

!x is more normal for kzalloc failure in the kernel.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
statement S1, S2;
@@

x = kzalloc(...);
if (
- x = NULL
+ !x
 ) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/lmv/lmv_intent.c |    2 +-
 drivers/staging/lustre/lustre/lmv/lmv_obd.c    |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/lmv/lmv_obd.c b/drivers/staging/lustre/lustre/lmv/lmv_obd.c
--- a/drivers/staging/lustre/lustre/lmv/lmv_obd.c
+++ b/drivers/staging/lustre/lustre/lmv/lmv_obd.c
@@ -716,7 +716,7 @@ repeat_fid2path:
 	if (remote_gf = NULL) {
 		remote_gf_size = sizeof(*remote_gf) + PATH_MAX;
 		remote_gf = kzalloc(remote_gf_size, GFP_NOFS);
-		if (remote_gf = NULL) {
+		if (!remote_gf) {
 			rc = -ENOMEM;
 			goto out_fid2path;
 		}
@@ -1398,7 +1398,7 @@ static int lmv_statfs(const struct lu_en
 		return rc;
 
 	temp = kzalloc(sizeof(*temp), GFP_NOFS);
-	if (temp = NULL)
+	if (!temp)
 		return -ENOMEM;
 
 	for (i = 0; i < lmv->desc.ld_tgt_count; i++) {
@@ -1730,7 +1730,7 @@ lmv_enqueue_remote(struct obd_export *ex
 	}
 
 	rdata = kzalloc(sizeof(*rdata), GFP_NOFS);
-	if (rdata = NULL) {
+	if (!rdata) {
 		rc = -ENOMEM;
 		goto out;
 	}
diff -u -p a/drivers/staging/lustre/lustre/lmv/lmv_intent.c b/drivers/staging/lustre/lustre/lmv/lmv_intent.c
--- a/drivers/staging/lustre/lustre/lmv/lmv_intent.c
+++ b/drivers/staging/lustre/lustre/lmv/lmv_intent.c
@@ -100,7 +100,7 @@ static int lmv_intent_remote(struct obd_
 	}
 
 	op_data = kzalloc(sizeof(*op_data), GFP_NOFS);
-	if (op_data = NULL) {
+	if (!op_data) {
 		rc = -ENOMEM;
 		goto out;
 	}

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
