From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:07 +0000
Subject: [PATCH 09/12] staging: lustre: obdclass: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-10-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/obdclass/class_obd.c      |    2 +-
 drivers/staging/lustre/lustre/obdclass/genops.c         |    6 +++---
 drivers/staging/lustre/lustre/obdclass/llog.c           |    6 +++---
 drivers/staging/lustre/lustre/obdclass/lprocfs_status.c |    2 +-
 drivers/staging/lustre/lustre/obdclass/lustre_peer.c    |    2 +-
 drivers/staging/lustre/lustre/obdclass/obd_config.c     |   10 +++++-----
 drivers/staging/lustre/lustre/obdclass/obd_mount.c      |   12 ++++++------
 7 files changed, 20 insertions(+), 20 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/obdclass/obd_mount.c b/drivers/staging/lustre/lustre/obdclass/obd_mount.c
--- a/drivers/staging/lustre/lustre/obdclass/obd_mount.c
+++ b/drivers/staging/lustre/lustre/obdclass/obd_mount.c
@@ -85,7 +85,7 @@ int lustre_process_log(struct super_bloc
 	LASSERT(cfg);
 
 	bufs = kzalloc(sizeof(*bufs), GFP_NOFS);
-	if (bufs = NULL)
+	if (!bufs)
 		return -ENOMEM;
 
 	/* mgc_process_config */
@@ -258,7 +258,7 @@ int lustre_start_mgc(struct super_block
 	mgssec = lsi->lsi_lmd->lmd_mgssec ? lsi->lsi_lmd->lmd_mgssec : "";
 
 	data = kzalloc(sizeof(*data), GFP_NOFS);
-	if (data = NULL) {
+	if (!data) {
 		rc = -ENOMEM;
 		goto out_free;
 	}
@@ -885,7 +885,7 @@ static int lmd_parse_mgssec(struct lustr
 		length = tail - ptr;
 
 	lmd->lmd_mgssec = kzalloc(length + 1, GFP_NOFS);
-	if (lmd->lmd_mgssec = NULL)
+	if (!lmd->lmd_mgssec)
 		return -ENOMEM;
 
 	memcpy(lmd->lmd_mgssec, ptr, length);
@@ -911,7 +911,7 @@ static int lmd_parse_string(char **handl
 		length = tail - ptr;
 
 	*handle = kzalloc(length + 1, GFP_NOFS);
-	if (*handle = NULL)
+	if (!*handle)
 		return -ENOMEM;
 
 	memcpy(*handle, ptr, length);
@@ -941,7 +941,7 @@ static int lmd_parse_mgs(struct lustre_m
 		oldlen = strlen(lmd->lmd_mgs) + 1;
 
 	mgsnid = kzalloc(oldlen + length + 1, GFP_NOFS);
-	if (mgsnid = NULL)
+	if (!mgsnid)
 		return -ENOMEM;
 
 	if (lmd->lmd_mgs != NULL) {
@@ -983,7 +983,7 @@ static int lmd_parse(char *options, stru
 	lmd->lmd_magic = LMD_MAGIC;
 
 	lmd->lmd_params = kzalloc(4096, GFP_NOFS);
-	if (lmd->lmd_params = NULL)
+	if (!lmd->lmd_params)
 		return -ENOMEM;
 	lmd->lmd_params[0] = '\0';
 
diff -u -p a/drivers/staging/lustre/lustre/obdclass/obd_config.c b/drivers/staging/lustre/lustre/obdclass/obd_config.c
--- a/drivers/staging/lustre/lustre/obdclass/obd_config.c
+++ b/drivers/staging/lustre/lustre/obdclass/obd_config.c
@@ -835,7 +835,7 @@ int class_add_profile(int proflen, char
 	CDEBUG(D_CONFIG, "Add profile %s\n", prof);
 
 	lprof = kzalloc(sizeof(*lprof), GFP_NOFS);
-	if (lprof = NULL)
+	if (!lprof)
 		return -ENOMEM;
 	INIT_LIST_HEAD(&lprof->lp_list);
 
@@ -979,7 +979,7 @@ struct lustre_cfg *lustre_cfg_rename(str
 	new_len = LUSTRE_CFG_BUFLEN(cfg, 1) + strlen(new_name) - name_len;
 
 	new_param = kzalloc(new_len, GFP_NOFS);
-	if (new_param = NULL)
+	if (!new_param)
 		return ERR_PTR(-ENOMEM);
 
 	strcpy(new_param, new_name);
@@ -987,7 +987,7 @@ struct lustre_cfg *lustre_cfg_rename(str
 		strcat(new_param, value);
 
 	bufs = kzalloc(sizeof(*bufs), GFP_NOFS);
-	if (bufs = NULL) {
+	if (!bufs) {
 		kfree(new_param);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -1461,7 +1461,7 @@ int class_config_llog_handler(const stru
 			inst_len = LUSTRE_CFG_BUFLEN(lcfg, 0) +
 				   sizeof(clli->cfg_instance) * 2 + 4;
 			inst_name = kzalloc(inst_len, GFP_NOFS);
-			if (inst_name = NULL) {
+			if (!inst_name) {
 				rc = -ENOMEM;
 				goto out;
 			}
@@ -1639,7 +1639,7 @@ int class_config_dump_handler(const stru
 	int	 rc = 0;
 
 	outstr = kzalloc(256, GFP_NOFS);
-	if (outstr = NULL)
+	if (!outstr)
 		return -ENOMEM;
 
 	if (rec->lrh_type = OBD_CFG_REC) {
diff -u -p a/drivers/staging/lustre/lustre/obdclass/lustre_peer.c b/drivers/staging/lustre/lustre/obdclass/lustre_peer.c
--- a/drivers/staging/lustre/lustre/obdclass/lustre_peer.c
+++ b/drivers/staging/lustre/lustre/obdclass/lustre_peer.c
@@ -105,7 +105,7 @@ int class_add_uuid(const char *uuid, __u
 		return -EOVERFLOW;
 
 	data = kzalloc(sizeof(*data), GFP_NOFS);
-	if (data = NULL)
+	if (!data)
 		return -ENOMEM;
 
 	obd_str2uuid(&data->un_uuid, uuid);
diff -u -p a/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c b/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c
--- a/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c
+++ b/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c
@@ -275,7 +275,7 @@ struct dentry *ldebugfs_add_symlink(cons
 		return NULL;
 
 	dest = kzalloc(MAX_STRING_SIZE + 1, GFP_KERNEL);
-	if (dest = NULL)
+	if (!dest)
 		return NULL;
 
 	va_start(ap, format);
diff -u -p a/drivers/staging/lustre/lustre/obdclass/llog.c b/drivers/staging/lustre/lustre/obdclass/llog.c
--- a/drivers/staging/lustre/lustre/obdclass/llog.c
+++ b/drivers/staging/lustre/lustre/obdclass/llog.c
@@ -61,7 +61,7 @@ static struct llog_handle *llog_alloc_ha
 	struct llog_handle *loghandle;
 
 	loghandle = kzalloc(sizeof(*loghandle), GFP_NOFS);
-	if (loghandle = NULL)
+	if (!loghandle)
 		return NULL;
 
 	init_rwsem(&loghandle->lgh_lock);
@@ -208,7 +208,7 @@ int llog_init_handle(const struct lu_env
 	LASSERT(handle->lgh_hdr = NULL);
 
 	llh = kzalloc(sizeof(*llh), GFP_NOFS);
-	if (llh = NULL)
+	if (!llh)
 		return -ENOMEM;
 	handle->lgh_hdr = llh;
 	/* first assign flags to use llog_client_ops */
@@ -435,7 +435,7 @@ int llog_process_or_fork(const struct lu
 	int		      rc;
 
 	lpi = kzalloc(sizeof(*lpi), GFP_NOFS);
-	if (lpi = NULL) {
+	if (!lpi) {
 		CERROR("cannot alloc pointer\n");
 		return -ENOMEM;
 	}
diff -u -p a/drivers/staging/lustre/lustre/obdclass/genops.c b/drivers/staging/lustre/lustre/obdclass/genops.c
--- a/drivers/staging/lustre/lustre/obdclass/genops.c
+++ b/drivers/staging/lustre/lustre/obdclass/genops.c
@@ -172,7 +172,7 @@ int class_register_type(struct obd_ops *
 
 	rc = -ENOMEM;
 	type = kzalloc(sizeof(*type), GFP_NOFS);
-	if (type = NULL)
+	if (!type)
 		return rc;
 
 	type->typ_dt_ops = kzalloc(sizeof(*type->typ_dt_ops), GFP_NOFS);
@@ -1016,7 +1016,7 @@ struct obd_import *class_new_import(stru
 	struct obd_import *imp;
 
 	imp = kzalloc(sizeof(*imp), GFP_NOFS);
-	if (imp = NULL)
+	if (!imp)
 		return NULL;
 
 	INIT_LIST_HEAD(&imp->imp_pinger_chain);
@@ -1819,7 +1819,7 @@ void *kuc_alloc(int payload_len, int tra
 	int len = kuc_len(payload_len);
 
 	lh = kzalloc(len, GFP_NOFS);
-	if (lh = NULL)
+	if (!lh)
 		return ERR_PTR(-ENOMEM);
 
 	lh->kuc_magic = KUC_MAGIC;
diff -u -p a/drivers/staging/lustre/lustre/obdclass/class_obd.c b/drivers/staging/lustre/lustre/obdclass/class_obd.c
--- a/drivers/staging/lustre/lustre/obdclass/class_obd.c
+++ b/drivers/staging/lustre/lustre/obdclass/class_obd.c
@@ -232,7 +232,7 @@ int class_handle_ioctl(unsigned int cmd,
 			goto out;
 		}
 		lcfg = kzalloc(data->ioc_plen1, GFP_NOFS);
-		if (lcfg = NULL) {
+		if (!lcfg) {
 			err = -ENOMEM;
 			goto out;
 		}

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
