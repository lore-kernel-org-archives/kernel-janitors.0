From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:22 +0000
Subject: [PATCH 1/11] staging: lustre: fid: Use kzalloc and kfree
Message-Id: <1430495482-933-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Replace OBD_ALLOC, OBD_ALLOC_WAIT, OBD_ALLOC_PTR, and OBD_ALLOC_PTR_WAIT by
kalloc/kcalloc, and OBD_FREE and OBD_FREE_PTR by kfree.

A simplified version of the semantic patch that makes these changes is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr,size; @@
- OBD_ALLOC(ptr,size)
+ ptr = kzalloc(size, GFP_NOFS)

@@ expression ptr, size; @@
- OBD_FREE(ptr, size);
+ kfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/fid/fid_request.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/fid/fid_request.c b/drivers/staging/lustre/lustre/fid/fid_request.c
--- a/drivers/staging/lustre/lustre/fid/fid_request.c
+++ b/drivers/staging/lustre/lustre/fid/fid_request.c
@@ -505,11 +505,11 @@ int client_fid_init(struct obd_device *o
 	char *prefix;
 	int rc;
 
-	OBD_ALLOC_PTR(cli->cl_seq);
+	cli->cl_seq = kzalloc(sizeof(*cli->cl_seq), GFP_NOFS);
 	if (cli->cl_seq = NULL)
 		return -ENOMEM;
 
-	OBD_ALLOC(prefix, MAX_OBD_NAME + 5);
+	prefix = kzalloc(MAX_OBD_NAME + 5, GFP_NOFS);
 	if (prefix = NULL) {
 		rc = -ENOMEM;
 		goto out_free_seq;
@@ -519,13 +519,13 @@ int client_fid_init(struct obd_device *o
 
 	/* Init client side sequence-manager */
 	rc = seq_client_init(cli->cl_seq, exp, type, prefix, NULL);
-	OBD_FREE(prefix, MAX_OBD_NAME + 5);
+	kfree(prefix);
 	if (rc)
 		goto out_free_seq;
 
 	return rc;
 out_free_seq:
-	OBD_FREE_PTR(cli->cl_seq);
+	kfree(cli->cl_seq);
 	cli->cl_seq = NULL;
 	return rc;
 }
@@ -537,7 +537,7 @@ int client_fid_fini(struct obd_device *o
 
 	if (cli->cl_seq != NULL) {
 		seq_client_fini(cli->cl_seq);
-		OBD_FREE_PTR(cli->cl_seq);
+		kfree(cli->cl_seq);
 		cli->cl_seq = NULL;
 	}
 

