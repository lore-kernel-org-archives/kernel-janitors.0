From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:17 +0000
Subject: [PATCH 6/11] staging: lustre: mdc: Use kzalloc and kfree
Message-Id: <1430495482-933-7-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/mdc/lproc_mdc.c   |    4 +--
 drivers/staging/lustre/lustre/mdc/mdc_locks.c   |    2 -
 drivers/staging/lustre/lustre/mdc/mdc_request.c |   30 ++++++++++++------------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/mdc/mdc_request.c b/drivers/staging/lustre/lustre/mdc/mdc_request.c
--- a/drivers/staging/lustre/lustre/mdc/mdc_request.c
+++ b/drivers/staging/lustre/lustre/mdc/mdc_request.c
@@ -1201,7 +1201,7 @@ static int mdc_ioc_fid2path(struct obd_e
 
 	/* Key is KEY_FID2PATH + getinfo_fid2path description */
 	keylen = cfs_size_round(sizeof(KEY_FID2PATH)) + sizeof(*gf);
-	OBD_ALLOC(key, keylen);
+	key = kzalloc(keylen, GFP_NOFS);
 	if (key = NULL)
 		return -ENOMEM;
 	memcpy(key, KEY_FID2PATH, sizeof(KEY_FID2PATH));
@@ -1234,7 +1234,7 @@ static int mdc_ioc_fid2path(struct obd_e
 	       PFID(&gf->gf_fid), gf->gf_recno, gf->gf_linkno, gf->gf_path);
 
 out:
-	OBD_FREE(key, keylen);
+	kfree(key);
 	return rc;
 }
 
@@ -1604,7 +1604,7 @@ static int mdc_changelog_send_thread(voi
 	CDEBUG(D_CHANGELOG, "changelog to fp=%p start %llu\n",
 	       cs->cs_fp, cs->cs_startrec);
 
-	OBD_ALLOC(cs->cs_buf, KUC_CHANGELOG_MSG_MAXSIZE);
+	cs->cs_buf = kzalloc(KUC_CHANGELOG_MSG_MAXSIZE, GFP_NOFS);
 	if (cs->cs_buf = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -1645,8 +1645,8 @@ out:
 	if (ctxt)
 		llog_ctxt_put(ctxt);
 	if (cs->cs_buf)
-		OBD_FREE(cs->cs_buf, KUC_CHANGELOG_MSG_MAXSIZE);
-	OBD_FREE_PTR(cs);
+		kfree(cs->cs_buf);
+	kfree(cs);
 	return rc;
 }
 
@@ -1657,7 +1657,7 @@ static int mdc_ioc_changelog_send(struct
 	int rc;
 
 	/* Freed in mdc_changelog_send_thread */
-	OBD_ALLOC_PTR(cs);
+	cs = kzalloc(sizeof(*cs), GFP_NOFS);
 	if (!cs)
 		return -ENOMEM;
 
@@ -1679,7 +1679,7 @@ static int mdc_ioc_changelog_send(struct
 	}
 
 	CERROR("Failed to start changelog thread: %d\n", rc);
-	OBD_FREE_PTR(cs);
+	kfree(cs);
 	return rc;
 }
 
@@ -1937,7 +1937,7 @@ static int mdc_iocontrol(unsigned int cm
 		struct if_quotactl *qctl = karg;
 		struct obd_quotactl *oqctl;
 
-		OBD_ALLOC_PTR(oqctl);
+		oqctl = kzalloc(sizeof(*oqctl), GFP_NOFS);
 		if (oqctl = NULL) {
 			rc = -ENOMEM;
 			goto out;
@@ -1951,7 +1951,7 @@ static int mdc_iocontrol(unsigned int cm
 			qctl->obd_uuid = obd->u.cli.cl_target_uuid;
 		}
 
-		OBD_FREE_PTR(oqctl);
+		kfree(oqctl);
 		goto out;
 	}
 	case LL_IOC_GET_CONNECT_FLAGS:
@@ -2430,14 +2430,14 @@ static int mdc_setup(struct obd_device *
 	struct lprocfs_static_vars lvars = { NULL };
 	int rc;
 
-	OBD_ALLOC(cli->cl_rpc_lock, sizeof(*cli->cl_rpc_lock));
+	cli->cl_rpc_lock = kzalloc(sizeof(*cli->cl_rpc_lock), GFP_NOFS);
 	if (!cli->cl_rpc_lock)
 		return -ENOMEM;
 	mdc_init_rpc_lock(cli->cl_rpc_lock);
 
 	ptlrpcd_addref();
 
-	OBD_ALLOC(cli->cl_close_lock, sizeof(*cli->cl_close_lock));
+	cli->cl_close_lock = kzalloc(sizeof(*cli->cl_close_lock), GFP_NOFS);
 	if (!cli->cl_close_lock) {
 		rc = -ENOMEM;
 		goto err_rpc_lock;
@@ -2465,9 +2465,9 @@ static int mdc_setup(struct obd_device *
 	return rc;
 
 err_close_lock:
-	OBD_FREE(cli->cl_close_lock, sizeof(*cli->cl_close_lock));
+	kfree(cli->cl_close_lock);
 err_rpc_lock:
-	OBD_FREE(cli->cl_rpc_lock, sizeof(*cli->cl_rpc_lock));
+	kfree(cli->cl_rpc_lock);
 	ptlrpcd_decref();
 	return rc;
 }
@@ -2525,8 +2525,8 @@ static int mdc_cleanup(struct obd_device
 {
 	struct client_obd *cli = &obd->u.cli;
 
-	OBD_FREE(cli->cl_rpc_lock, sizeof(*cli->cl_rpc_lock));
-	OBD_FREE(cli->cl_close_lock, sizeof(*cli->cl_close_lock));
+	kfree(cli->cl_rpc_lock);
+	kfree(cli->cl_close_lock);
 
 	ptlrpcd_decref();
 
diff -u -p a/drivers/staging/lustre/lustre/mdc/mdc_locks.c b/drivers/staging/lustre/lustre/mdc/mdc_locks.c
--- a/drivers/staging/lustre/lustre/mdc/mdc_locks.c
+++ b/drivers/staging/lustre/lustre/mdc/mdc_locks.c
@@ -1251,7 +1251,7 @@ static int mdc_intent_getattr_async_inte
 	rc = mdc_finish_intent_lock(exp, req, &minfo->mi_data, it, lockh);
 
 out:
-	OBD_FREE_PTR(einfo);
+	kfree(einfo);
 	minfo->mi_cb(req, minfo, rc);
 	return 0;
 }
diff -u -p a/drivers/staging/lustre/lustre/mdc/lproc_mdc.c b/drivers/staging/lustre/lustre/mdc/lproc_mdc.c
--- a/drivers/staging/lustre/lustre/mdc/lproc_mdc.c
+++ b/drivers/staging/lustre/lustre/mdc/lproc_mdc.c
@@ -106,7 +106,7 @@ static ssize_t mdc_kuc_write(struct file
 	len = sizeof(*lh) + sizeof(*hal) + MTI_NAME_MAXLEN +
 		/* for mockup below */ 2 * cfs_size_round(sizeof(*hai));
 
-	OBD_ALLOC(lh, len);
+	lh = kzalloc(len, GFP_NOFS);
 	if (!lh)
 		return -ENOMEM;
 
@@ -141,7 +141,7 @@ static ssize_t mdc_kuc_write(struct file
 		rc = libcfs_kkuc_msg_put(fp, lh);
 		fput(fp);
 	}
-	OBD_FREE(lh, len);
+	kfree(lh);
 	if (rc < 0)
 		return rc;
 	return count;

