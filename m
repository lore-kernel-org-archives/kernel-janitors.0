From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:15 +0000
Subject: [PATCH 8/11] staging: lustre: obdclass: Use kzalloc and kfree
Message-Id: <1430495482-933-5-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/obdclass/acl.c            |   29 ++---
 drivers/staging/lustre/lustre/obdclass/capa.c           |    4 
 drivers/staging/lustre/lustre/obdclass/cl_io.c          |   13 +-
 drivers/staging/lustre/lustre/obdclass/cl_page.c        |    2 
 drivers/staging/lustre/lustre/obdclass/class_obd.c      |    4 
 drivers/staging/lustre/lustre/obdclass/genops.c         |   40 +++----
 drivers/staging/lustre/lustre/obdclass/llog.c           |   24 ++--
 drivers/staging/lustre/lustre/obdclass/llog_obd.c       |    4 
 drivers/staging/lustre/lustre/obdclass/lprocfs_status.c |   14 +-
 drivers/staging/lustre/lustre/obdclass/lu_object.c      |    6 -
 drivers/staging/lustre/lustre/obdclass/lustre_handles.c |    2 
 drivers/staging/lustre/lustre/obdclass/lustre_peer.c    |    6 -
 drivers/staging/lustre/lustre/obdclass/obd_config.c     |   50 ++++-----
 drivers/staging/lustre/lustre/obdclass/obd_mount.c      |   86 +++++++---------
 14 files changed, 138 insertions(+), 146 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/obdclass/obd_mount.c b/drivers/staging/lustre/lustre/obdclass/obd_mount.c
--- a/drivers/staging/lustre/lustre/obdclass/obd_mount.c
+++ b/drivers/staging/lustre/lustre/obdclass/obd_mount.c
@@ -84,7 +84,7 @@ int lustre_process_log(struct super_bloc
 	LASSERT(mgc);
 	LASSERT(cfg);
 
-	OBD_ALLOC_PTR(bufs);
+	bufs = kzalloc(sizeof(*bufs), GFP_NOFS);
 	if (bufs = NULL)
 		return -ENOMEM;
 
@@ -97,7 +97,7 @@ int lustre_process_log(struct super_bloc
 	rc = obd_process_config(mgc, sizeof(*lcfg), lcfg);
 	lustre_cfg_free(lcfg);
 
-	OBD_FREE_PTR(bufs);
+	kfree(bufs);
 
 	if (rc = -EINVAL)
 		LCONSOLE_ERROR_MSG(0x15b, "%s: The configuration from log '%s' failed from the MGS (%d).  Make sure this client and the MGS are running compatible versions of Lustre.\n",
@@ -247,8 +247,8 @@ int lustre_start_mgc(struct super_block
 	mutex_lock(&mgc_start_lock);
 
 	len = strlen(LUSTRE_MGC_OBDNAME) + strlen(libcfs_nid2str(nid)) + 1;
-	OBD_ALLOC(mgcname, len);
-	OBD_ALLOC(niduuid, len + 2);
+	mgcname = kzalloc(len, GFP_NOFS);
+	niduuid = kzalloc(len + 2, GFP_NOFS);
 	if (!mgcname || !niduuid) {
 		rc = -ENOMEM;
 		goto out_free;
@@ -257,7 +257,7 @@ int lustre_start_mgc(struct super_block
 
 	mgssec = lsi->lsi_lmd->lmd_mgssec ? lsi->lsi_lmd->lmd_mgssec : "";
 
-	OBD_ALLOC_PTR(data);
+	data = kzalloc(sizeof(*data), GFP_NOFS);
 	if (data = NULL) {
 		rc = -ENOMEM;
 		goto out_free;
@@ -375,7 +375,7 @@ int lustre_start_mgc(struct super_block
 	lsi->lsi_lmd->lmd_mgs_failnodes = 1;
 
 	/* Random uuid for MGC allows easier reconnects */
-	OBD_ALLOC_PTR(uuid);
+	uuid = kzalloc(sizeof(*uuid), GFP_NOFS);
 	if (!uuid) {
 		rc = -ENOMEM;
 		goto out_free;
@@ -388,7 +388,7 @@ int lustre_start_mgc(struct super_block
 	rc = lustre_start_simple(mgcname, LUSTRE_MGC_NAME,
 				 (char *)uuid->uuid, LUSTRE_MGS_OBDNAME,
 				 niduuid, NULL, NULL);
-	OBD_FREE_PTR(uuid);
+	kfree(uuid);
 	if (rc)
 		goto out_free;
 
@@ -465,11 +465,11 @@ out_free:
 	mutex_unlock(&mgc_start_lock);
 
 	if (data)
-		OBD_FREE_PTR(data);
+		kfree(data);
 	if (mgcname)
-		OBD_FREE(mgcname, len);
+		kfree(mgcname);
 	if (niduuid)
-		OBD_FREE(niduuid, len + 2);
+		kfree(niduuid);
 	return rc;
 }
 
@@ -513,7 +513,7 @@ static int lustre_stop_mgc(struct super_
 	/* Save the obdname for cleaning the nid uuids, which are
 	   obdname_XX */
 	len = strlen(obd->obd_name) + 6;
-	OBD_ALLOC(niduuid, len);
+	niduuid = kzalloc(len, GFP_NOFS);
 	if (niduuid) {
 		strcpy(niduuid, obd->obd_name);
 		ptr = niduuid + strlen(niduuid);
@@ -539,7 +539,7 @@ static int lustre_stop_mgc(struct super_
 	}
 out:
 	if (niduuid)
-		OBD_FREE(niduuid, len);
+		kfree(niduuid);
 
 	/* class_import_put will get rid of the additional connections */
 	mutex_unlock(&mgc_start_lock);
@@ -552,12 +552,12 @@ struct lustre_sb_info *lustre_init_lsi(s
 {
 	struct lustre_sb_info *lsi;
 
-	OBD_ALLOC_PTR(lsi);
+	lsi = kzalloc(sizeof(*lsi), GFP_NOFS);
 	if (!lsi)
 		return NULL;
-	OBD_ALLOC_PTR(lsi->lsi_lmd);
+	lsi->lsi_lmd = kzalloc(sizeof(*lsi->lsi_lmd), GFP_NOFS);
 	if (!lsi->lsi_lmd) {
-		OBD_FREE_PTR(lsi);
+		kfree(lsi);
 		return NULL;
 	}
 
@@ -586,35 +586,27 @@ static int lustre_free_lsi(struct super_
 
 	if (lsi->lsi_lmd != NULL) {
 		if (lsi->lsi_lmd->lmd_dev != NULL)
-			OBD_FREE(lsi->lsi_lmd->lmd_dev,
-				 strlen(lsi->lsi_lmd->lmd_dev) + 1);
+			kfree(lsi->lsi_lmd->lmd_dev);
 		if (lsi->lsi_lmd->lmd_profile != NULL)
-			OBD_FREE(lsi->lsi_lmd->lmd_profile,
-				 strlen(lsi->lsi_lmd->lmd_profile) + 1);
+			kfree(lsi->lsi_lmd->lmd_profile);
 		if (lsi->lsi_lmd->lmd_mgssec != NULL)
-			OBD_FREE(lsi->lsi_lmd->lmd_mgssec,
-				 strlen(lsi->lsi_lmd->lmd_mgssec) + 1);
+			kfree(lsi->lsi_lmd->lmd_mgssec);
 		if (lsi->lsi_lmd->lmd_opts != NULL)
-			OBD_FREE(lsi->lsi_lmd->lmd_opts,
-				 strlen(lsi->lsi_lmd->lmd_opts) + 1);
+			kfree(lsi->lsi_lmd->lmd_opts);
 		if (lsi->lsi_lmd->lmd_exclude_count)
-			OBD_FREE(lsi->lsi_lmd->lmd_exclude,
-				 sizeof(lsi->lsi_lmd->lmd_exclude[0]) *
-				 lsi->lsi_lmd->lmd_exclude_count);
+			kfree(lsi->lsi_lmd->lmd_exclude);
 		if (lsi->lsi_lmd->lmd_mgs != NULL)
-			OBD_FREE(lsi->lsi_lmd->lmd_mgs,
-				 strlen(lsi->lsi_lmd->lmd_mgs) + 1);
+			kfree(lsi->lsi_lmd->lmd_mgs);
 		if (lsi->lsi_lmd->lmd_osd_type != NULL)
-			OBD_FREE(lsi->lsi_lmd->lmd_osd_type,
-				 strlen(lsi->lsi_lmd->lmd_osd_type) + 1);
+			kfree(lsi->lsi_lmd->lmd_osd_type);
 		if (lsi->lsi_lmd->lmd_params != NULL)
-			OBD_FREE(lsi->lsi_lmd->lmd_params, 4096);
+			kfree(lsi->lsi_lmd->lmd_params);
 
-		OBD_FREE(lsi->lsi_lmd, sizeof(*lsi->lsi_lmd));
+		kfree(lsi->lsi_lmd);
 	}
 
 	LASSERT(lsi->lsi_llsbi = NULL);
-	OBD_FREE(lsi, sizeof(*lsi));
+	kfree(lsi);
 	s2lsi_nocast(sb) = NULL;
 
 	return 0;
@@ -846,7 +838,7 @@ static int lmd_make_exclusion(struct lus
 	devmax = strlen(ptr) / 8 + 1;
 
 	/* temp storage until we figure out how many we have */
-	OBD_ALLOC(exclude_list, sizeof(index) * devmax);
+	exclude_list = kcalloc(devmax, sizeof(index), GFP_NOFS);
 	if (!exclude_list)
 		return -ENOMEM;
 
@@ -875,8 +867,8 @@ static int lmd_make_exclusion(struct lus
 
 	if (lmd->lmd_exclude_count) {
 		/* permanent, freed in lustre_free_lsi */
-		OBD_ALLOC(lmd->lmd_exclude, sizeof(index) *
-			  lmd->lmd_exclude_count);
+		lmd->lmd_exclude = kcalloc(lmd->lmd_exclude_count,
+					   sizeof(index), GFP_NOFS);
 		if (lmd->lmd_exclude) {
 			memcpy(lmd->lmd_exclude, exclude_list,
 			       sizeof(index) * lmd->lmd_exclude_count);
@@ -885,7 +877,7 @@ static int lmd_make_exclusion(struct lus
 			lmd->lmd_exclude_count = 0;
 		}
 	}
-	OBD_FREE(exclude_list, sizeof(index) * devmax);
+	kfree(exclude_list);
 	return rc;
 }
 
@@ -895,7 +887,7 @@ static int lmd_parse_mgssec(struct lustr
 	int     length;
 
 	if (lmd->lmd_mgssec != NULL) {
-		OBD_FREE(lmd->lmd_mgssec, strlen(lmd->lmd_mgssec) + 1);
+		kfree(lmd->lmd_mgssec);
 		lmd->lmd_mgssec = NULL;
 	}
 
@@ -905,7 +897,7 @@ static int lmd_parse_mgssec(struct lustr
 	else
 		length = tail - ptr;
 
-	OBD_ALLOC(lmd->lmd_mgssec, length + 1);
+	lmd->lmd_mgssec = kzalloc(length + 1, GFP_NOFS);
 	if (lmd->lmd_mgssec = NULL)
 		return -ENOMEM;
 
@@ -923,7 +915,7 @@ static int lmd_parse_string(char **handl
 		return -EINVAL;
 
 	if (*handle != NULL) {
-		OBD_FREE(*handle, strlen(*handle) + 1);
+		kfree(*handle);
 		*handle = NULL;
 	}
 
@@ -933,7 +925,7 @@ static int lmd_parse_string(char **handl
 	else
 		length = tail - ptr;
 
-	OBD_ALLOC(*handle, length + 1);
+	*handle = kzalloc(length + 1, GFP_NOFS);
 	if (*handle = NULL)
 		return -ENOMEM;
 
@@ -963,7 +955,7 @@ static int lmd_parse_mgs(struct lustre_m
 	if (lmd->lmd_mgs != NULL)
 		oldlen = strlen(lmd->lmd_mgs) + 1;
 
-	OBD_ALLOC(mgsnid, oldlen + length + 1);
+	mgsnid = kzalloc(oldlen + length + 1, GFP_NOFS);
 	if (mgsnid = NULL)
 		return -ENOMEM;
 
@@ -971,7 +963,7 @@ static int lmd_parse_mgs(struct lustre_m
 		/* Multiple mgsnid= are taken to mean failover locations */
 		memcpy(mgsnid, lmd->lmd_mgs, oldlen);
 		mgsnid[oldlen - 1] = ':';
-		OBD_FREE(lmd->lmd_mgs, oldlen);
+		kfree(lmd->lmd_mgs);
 	}
 	memcpy(mgsnid + oldlen, *ptr, length);
 	mgsnid[oldlen + length] = '\0';
@@ -1005,7 +997,7 @@ static int lmd_parse(char *options, stru
 	}
 	lmd->lmd_magic = LMD_MAGIC;
 
-	OBD_ALLOC(lmd->lmd_params, 4096);
+	lmd->lmd_params = kzalloc(4096, GFP_NOFS);
 	if (lmd->lmd_params = NULL)
 		return -ENOMEM;
 	lmd->lmd_params[0] = '\0';
@@ -1143,14 +1135,14 @@ static int lmd_parse(char *options, stru
 		/* Remove leading /s from fsname */
 		while (*++s1 = '/') ;
 		/* Freed in lustre_free_lsi */
-		OBD_ALLOC(lmd->lmd_profile, strlen(s1) + 8);
+		lmd->lmd_profile = kzalloc(strlen(s1) + 8, GFP_NOFS);
 		if (!lmd->lmd_profile)
 			return -ENOMEM;
 		sprintf(lmd->lmd_profile, "%s-client", s1);
 	}
 
 	/* Freed in lustre_free_lsi */
-	OBD_ALLOC(lmd->lmd_dev, strlen(devname) + 1);
+	lmd->lmd_dev = kzalloc(strlen(devname) + 1, GFP_NOFS);
 	if (!lmd->lmd_dev)
 		return -ENOMEM;
 	strcpy(lmd->lmd_dev, devname);
@@ -1161,7 +1153,7 @@ static int lmd_parse(char *options, stru
 		*s1-- = 0;
 	if (*options != 0) {
 		/* Freed in lustre_free_lsi */
-		OBD_ALLOC(lmd->lmd_opts, strlen(options) + 1);
+		lmd->lmd_opts = kzalloc(strlen(options) + 1, GFP_NOFS);
 		if (!lmd->lmd_opts)
 			return -ENOMEM;
 		strcpy(lmd->lmd_opts, options);
diff -u -p a/drivers/staging/lustre/lustre/obdclass/obd_config.c b/drivers/staging/lustre/lustre/obdclass/obd_config.c
--- a/drivers/staging/lustre/lustre/obdclass/obd_config.c
+++ b/drivers/staging/lustre/lustre/obdclass/obd_config.c
@@ -860,13 +860,13 @@ int class_add_profile(int proflen, char
 
 	CDEBUG(D_CONFIG, "Add profile %s\n", prof);
 
-	OBD_ALLOC(lprof, sizeof(*lprof));
+	lprof = kzalloc(sizeof(*lprof), GFP_NOFS);
 	if (lprof = NULL)
 		return -ENOMEM;
 	INIT_LIST_HEAD(&lprof->lp_list);
 
 	LASSERT(proflen = (strlen(prof) + 1));
-	OBD_ALLOC(lprof->lp_profile, proflen);
+	lprof->lp_profile = kzalloc(proflen, GFP_NOFS);
 	if (lprof->lp_profile = NULL) {
 		err = -ENOMEM;
 		goto out;
@@ -874,7 +874,7 @@ int class_add_profile(int proflen, char
 	memcpy(lprof->lp_profile, prof, proflen);
 
 	LASSERT(osclen = (strlen(osc) + 1));
-	OBD_ALLOC(lprof->lp_dt, osclen);
+	lprof->lp_dt = kzalloc(osclen, GFP_NOFS);
 	if (lprof->lp_dt = NULL) {
 		err = -ENOMEM;
 		goto out;
@@ -883,7 +883,7 @@ int class_add_profile(int proflen, char
 
 	if (mdclen > 0) {
 		LASSERT(mdclen = (strlen(mdc) + 1));
-		OBD_ALLOC(lprof->lp_md, mdclen);
+		lprof->lp_md = kzalloc(mdclen, GFP_NOFS);
 		if (lprof->lp_md = NULL) {
 			err = -ENOMEM;
 			goto out;
@@ -896,12 +896,12 @@ int class_add_profile(int proflen, char
 
 out:
 	if (lprof->lp_md)
-		OBD_FREE(lprof->lp_md, mdclen);
+		kfree(lprof->lp_md);
 	if (lprof->lp_dt)
-		OBD_FREE(lprof->lp_dt, osclen);
+		kfree(lprof->lp_dt);
 	if (lprof->lp_profile)
-		OBD_FREE(lprof->lp_profile, proflen);
-	OBD_FREE(lprof, sizeof(*lprof));
+		kfree(lprof->lp_profile);
+	kfree(lprof);
 	return err;
 }
 
@@ -914,11 +914,11 @@ void class_del_profile(const char *prof)
 	lprof = class_get_profile(prof);
 	if (lprof) {
 		list_del(&lprof->lp_list);
-		OBD_FREE(lprof->lp_profile, strlen(lprof->lp_profile) + 1);
-		OBD_FREE(lprof->lp_dt, strlen(lprof->lp_dt) + 1);
+		kfree(lprof->lp_profile);
+		kfree(lprof->lp_dt);
 		if (lprof->lp_md)
-			OBD_FREE(lprof->lp_md, strlen(lprof->lp_md) + 1);
-		OBD_FREE(lprof, sizeof(*lprof));
+			kfree(lprof->lp_md);
+		kfree(lprof);
 	}
 }
 EXPORT_SYMBOL(class_del_profile);
@@ -930,11 +930,11 @@ void class_del_profiles(void)
 
 	list_for_each_entry_safe(lprof, n, &lustre_profile_list, lp_list) {
 		list_del(&lprof->lp_list);
-		OBD_FREE(lprof->lp_profile, strlen(lprof->lp_profile) + 1);
-		OBD_FREE(lprof->lp_dt, strlen(lprof->lp_dt) + 1);
+		kfree(lprof->lp_profile);
+		kfree(lprof->lp_dt);
 		if (lprof->lp_md)
-			OBD_FREE(lprof->lp_md, strlen(lprof->lp_md) + 1);
-		OBD_FREE(lprof, sizeof(*lprof));
+			kfree(lprof->lp_md);
+		kfree(lprof);
 	}
 }
 EXPORT_SYMBOL(class_del_profiles);
@@ -1011,7 +1011,7 @@ struct lustre_cfg *lustre_cfg_rename(str
 
 	new_len = LUSTRE_CFG_BUFLEN(cfg, 1) + strlen(new_name) - name_len;
 
-	OBD_ALLOC(new_param, new_len);
+	new_param = kzalloc(new_len, GFP_NOFS);
 	if (new_param = NULL)
 		return ERR_PTR(-ENOMEM);
 
@@ -1019,9 +1019,9 @@ struct lustre_cfg *lustre_cfg_rename(str
 	if (value != NULL)
 		strcat(new_param, value);
 
-	OBD_ALLOC_PTR(bufs);
+	bufs = kzalloc(sizeof(*bufs), GFP_NOFS);
 	if (bufs = NULL) {
-		OBD_FREE(new_param, new_len);
+		kfree(new_param);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -1031,8 +1031,8 @@ struct lustre_cfg *lustre_cfg_rename(str
 
 	new_cfg = lustre_cfg_new(cfg->lcfg_command, bufs);
 
-	OBD_FREE(new_param, new_len);
-	OBD_FREE_PTR(bufs);
+	kfree(new_param);
+	kfree(bufs);
 	if (new_cfg = NULL)
 		return ERR_PTR(-ENOMEM);
 
@@ -1493,7 +1493,7 @@ int class_config_llog_handler(const stru
 			inst = 1;
 			inst_len = LUSTRE_CFG_BUFLEN(lcfg, 0) +
 				   sizeof(clli->cfg_instance) * 2 + 4;
-			OBD_ALLOC(inst_name, inst_len);
+			inst_name = kzalloc(inst_len, GFP_NOFS);
 			if (inst_name = NULL) {
 				rc = -ENOMEM;
 				goto out;
@@ -1556,7 +1556,7 @@ int class_config_llog_handler(const stru
 		lustre_cfg_free(lcfg_new);
 
 		if (inst)
-			OBD_FREE(inst_name, inst_len);
+			kfree(inst_name);
 		break;
 	}
 	default:
@@ -1671,7 +1671,7 @@ int class_config_dump_handler(const stru
 	char	*outstr;
 	int	 rc = 0;
 
-	OBD_ALLOC(outstr, 256);
+	outstr = kzalloc(256, GFP_NOFS);
 	if (outstr = NULL)
 		return -ENOMEM;
 
@@ -1683,7 +1683,7 @@ int class_config_dump_handler(const stru
 		rc = -EINVAL;
 	}
 
-	OBD_FREE(outstr, 256);
+	kfree(outstr);
 	return rc;
 }
 
diff -u -p a/drivers/staging/lustre/lustre/obdclass/lustre_peer.c b/drivers/staging/lustre/lustre/obdclass/lustre_peer.c
--- a/drivers/staging/lustre/lustre/obdclass/lustre_peer.c
+++ b/drivers/staging/lustre/lustre/obdclass/lustre_peer.c
@@ -104,7 +104,7 @@ int class_add_uuid(const char *uuid, __u
 	if (strlen(uuid) > UUID_MAX - 1)
 		return -EOVERFLOW;
 
-	OBD_ALLOC_PTR(data);
+	data = kzalloc(sizeof(*data), GFP_NOFS);
 	if (data = NULL)
 		return -ENOMEM;
 
@@ -136,7 +136,7 @@ int class_add_uuid(const char *uuid, __u
 	if (found) {
 		CDEBUG(D_INFO, "found uuid %s %s cnt=%d\n", uuid,
 		       libcfs_nid2str(nid), entry->un_nid_count);
-		OBD_FREE(data, sizeof(*data));
+		kfree(data);
 	} else {
 		CDEBUG(D_INFO, "add uuid %s %s\n", uuid, libcfs_nid2str(nid));
 	}
@@ -180,7 +180,7 @@ int class_del_uuid(const char *uuid)
 		       libcfs_nid2str(data->un_nids[0]),
 		       data->un_nid_count);
 
-		OBD_FREE(data, sizeof(*data));
+		kfree(data);
 	}
 
 	return 0;
diff -u -p a/drivers/staging/lustre/lustre/obdclass/lustre_handles.c b/drivers/staging/lustre/lustre/obdclass/lustre_handles.c
--- a/drivers/staging/lustre/lustre/obdclass/lustre_handles.c
+++ b/drivers/staging/lustre/lustre/obdclass/lustre_handles.c
@@ -186,7 +186,7 @@ void class_handle_free_cb(struct rcu_hea
 	if (h->h_ops->hop_free != NULL)
 		h->h_ops->hop_free(ptr, h->h_size);
 	else
-		OBD_FREE(ptr, h->h_size);
+		kfree(ptr);
 }
 EXPORT_SYMBOL(class_handle_free_cb);
 
diff -u -p a/drivers/staging/lustre/lustre/obdclass/lu_object.c b/drivers/staging/lustre/lustre/obdclass/lu_object.c
--- a/drivers/staging/lustre/lustre/obdclass/lu_object.c
+++ b/drivers/staging/lustre/lustre/obdclass/lu_object.c
@@ -1532,7 +1532,7 @@ static void keys_fini(struct lu_context
 	for (i = 0; i < ARRAY_SIZE(lu_keys); ++i)
 		key_fini(ctx, i);
 
-	OBD_FREE(ctx->lc_value, ARRAY_SIZE(lu_keys) * sizeof(ctx->lc_value[0]));
+	kfree(ctx->lc_value);
 	ctx->lc_value = NULL;
 }
 
@@ -1581,8 +1581,8 @@ static int keys_fill(struct lu_context *
 
 static int keys_init(struct lu_context *ctx)
 {
-	OBD_ALLOC(ctx->lc_value,
-		  ARRAY_SIZE(lu_keys) * sizeof(ctx->lc_value[0]));
+	ctx->lc_value = kcalloc(ARRAY_SIZE(lu_keys), sizeof(ctx->lc_value[0]),
+				GFP_NOFS);
 	if (likely(ctx->lc_value != NULL))
 		return keys_fill(ctx);
 
diff -u -p a/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c b/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c
--- a/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c
+++ b/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c
@@ -276,7 +276,7 @@ struct proc_dir_entry *lprocfs_add_symli
 	if (parent = NULL || format = NULL)
 		return NULL;
 
-	OBD_ALLOC_WAIT(dest, MAX_STRING_SIZE + 1);
+	dest = kzalloc(MAX_STRING_SIZE + 1, GFP_KERNEL);
 	if (dest = NULL)
 		return NULL;
 
@@ -289,7 +289,7 @@ struct proc_dir_entry *lprocfs_add_symli
 		CERROR("LprocFS: Could not create symbolic link from %s to %s",
 			name, dest);
 
-	OBD_FREE(dest, MAX_STRING_SIZE + 1);
+	kfree(dest);
 	return entry;
 }
 EXPORT_SYMBOL(lprocfs_add_symlink);
@@ -1006,7 +1006,7 @@ static void lprocfs_free_client_stats(st
 	if (client_stat->nid_ldlm_stats)
 		lprocfs_free_stats(&client_stat->nid_ldlm_stats);
 
-	OBD_FREE_PTR(client_stat);
+	kfree(client_stat);
 	return;
 
 }
@@ -1681,7 +1681,7 @@ int lprocfs_exp_setup(struct obd_export
 
 	CDEBUG(D_CONFIG, "using hash %p\n", obd->obd_nid_stats_hash);
 
-	OBD_ALLOC_PTR(new_stat);
+	new_stat = kzalloc(sizeof(*new_stat), GFP_NOFS);
 	if (new_stat = NULL)
 		return -ENOMEM;
 
@@ -1711,7 +1711,7 @@ int lprocfs_exp_setup(struct obd_export
 		goto destroy_new;
 	}
 	/* not found - create */
-	OBD_ALLOC(buffer, LNET_NIDSTR_SIZE);
+	buffer = kzalloc(LNET_NIDSTR_SIZE, GFP_NOFS);
 	if (buffer = NULL) {
 		rc = -ENOMEM;
 		goto destroy_new;
@@ -1721,7 +1721,7 @@ int lprocfs_exp_setup(struct obd_export
 	new_stat->nid_proc = lprocfs_register(buffer,
 					      obd->obd_proc_exports_entry,
 					      NULL, NULL);
-	OBD_FREE(buffer, LNET_NIDSTR_SIZE);
+	kfree(buffer);
 
 	if (IS_ERR(new_stat->nid_proc)) {
 		CERROR("Error making export directory for nid %s\n",
@@ -1763,7 +1763,7 @@ destroy_new_ns:
 
 destroy_new:
 	nidstat_putref(new_stat);
-	OBD_FREE_PTR(new_stat);
+	kfree(new_stat);
 	return rc;
 }
 EXPORT_SYMBOL(lprocfs_exp_setup);
diff -u -p a/drivers/staging/lustre/lustre/obdclass/llog_obd.c b/drivers/staging/lustre/lustre/obdclass/llog_obd.c
--- a/drivers/staging/lustre/lustre/obdclass/llog_obd.c
+++ b/drivers/staging/lustre/lustre/obdclass/llog_obd.c
@@ -46,7 +46,7 @@ static struct llog_ctxt *llog_new_ctxt(s
 {
 	struct llog_ctxt *ctxt;
 
-	OBD_ALLOC_PTR(ctxt);
+	ctxt = kzalloc(sizeof(*ctxt), GFP_NOFS);
 	if (!ctxt)
 		return NULL;
 
@@ -66,7 +66,7 @@ static void llog_ctxt_destroy(struct llo
 		class_import_put(ctxt->loc_imp);
 		ctxt->loc_imp = NULL;
 	}
-	OBD_FREE_PTR(ctxt);
+	kfree(ctxt);
 }
 
 int __llog_ctxt_put(const struct lu_env *env, struct llog_ctxt *ctxt)
diff -u -p a/drivers/staging/lustre/lustre/obdclass/llog.c b/drivers/staging/lustre/lustre/obdclass/llog.c
--- a/drivers/staging/lustre/lustre/obdclass/llog.c
+++ b/drivers/staging/lustre/lustre/obdclass/llog.c
@@ -60,7 +60,7 @@ static struct llog_handle *llog_alloc_ha
 {
 	struct llog_handle *loghandle;
 
-	OBD_ALLOC_PTR(loghandle);
+	loghandle = kzalloc(sizeof(*loghandle), GFP_NOFS);
 	if (loghandle = NULL)
 		return NULL;
 
@@ -88,9 +88,9 @@ static void llog_free_handle(struct llog
 	else if (loghandle->lgh_hdr->llh_flags & LLOG_F_IS_CAT)
 		LASSERT(list_empty(&loghandle->u.chd.chd_head));
 	LASSERT(sizeof(*(loghandle->lgh_hdr)) = LLOG_CHUNK_SIZE);
-	OBD_FREE(loghandle->lgh_hdr, LLOG_CHUNK_SIZE);
+	kfree(loghandle->lgh_hdr);
 out:
-	OBD_FREE_PTR(loghandle);
+	kfree(loghandle);
 }
 
 void llog_handle_get(struct llog_handle *loghandle)
@@ -207,7 +207,7 @@ int llog_init_handle(const struct lu_env
 
 	LASSERT(handle->lgh_hdr = NULL);
 
-	OBD_ALLOC_PTR(llh);
+	llh = kzalloc(sizeof(*llh), GFP_NOFS);
 	if (llh = NULL)
 		return -ENOMEM;
 	handle->lgh_hdr = llh;
@@ -261,7 +261,7 @@ int llog_init_handle(const struct lu_env
 	}
 out:
 	if (rc) {
-		OBD_FREE_PTR(llh);
+		kfree(llh);
 		handle->lgh_hdr = NULL;
 	}
 	return rc;
@@ -283,7 +283,7 @@ static int llog_process_thread(void *arg
 
 	LASSERT(llh);
 
-	OBD_ALLOC(buf, LLOG_CHUNK_SIZE);
+	buf = kzalloc(LLOG_CHUNK_SIZE, GFP_NOFS);
 	if (!buf) {
 		lpi->lpi_rc = -ENOMEM;
 		return 0;
@@ -400,7 +400,7 @@ out:
 	if (cd != NULL)
 		cd->lpcd_last_idx = last_called_index;
 
-	OBD_FREE(buf, LLOG_CHUNK_SIZE);
+	kfree(buf);
 	lpi->lpi_rc = rc;
 	return 0;
 }
@@ -434,7 +434,7 @@ int llog_process_or_fork(const struct lu
 	struct llog_process_info *lpi;
 	int		      rc;
 
-	OBD_ALLOC_PTR(lpi);
+	lpi = kzalloc(sizeof(*lpi), GFP_NOFS);
 	if (lpi = NULL) {
 		CERROR("cannot alloc pointer\n");
 		return -ENOMEM;
@@ -454,7 +454,7 @@ int llog_process_or_fork(const struct lu
 		if (IS_ERR_VALUE(rc)) {
 			CERROR("%s: cannot start thread: rc = %d\n",
 			       loghandle->lgh_ctxt->loc_obd->obd_name, rc);
-			OBD_FREE_PTR(lpi);
+			kfree(lpi);
 			return rc;
 		}
 		wait_for_completion(&lpi->lpi_completion);
@@ -463,7 +463,7 @@ int llog_process_or_fork(const struct lu
 		llog_process_thread(lpi);
 	}
 	rc = lpi->lpi_rc;
-	OBD_FREE_PTR(lpi);
+	kfree(lpi);
 	return rc;
 }
 EXPORT_SYMBOL(llog_process_or_fork);
@@ -484,7 +484,7 @@ int llog_reverse_process(const struct lu
 	void *buf;
 	int rc = 0, first_index = 1, index, idx;
 
-	OBD_ALLOC(buf, LLOG_CHUNK_SIZE);
+	buf = kzalloc(LLOG_CHUNK_SIZE, GFP_NOFS);
 	if (!buf)
 		return -ENOMEM;
 
@@ -564,7 +564,7 @@ int llog_reverse_process(const struct lu
 
 out:
 	if (buf)
-		OBD_FREE(buf, LLOG_CHUNK_SIZE);
+		kfree(buf);
 	return rc;
 }
 EXPORT_SYMBOL(llog_reverse_process);
diff -u -p a/drivers/staging/lustre/lustre/obdclass/genops.c b/drivers/staging/lustre/lustre/obdclass/genops.c
--- a/drivers/staging/lustre/lustre/obdclass/genops.c
+++ b/drivers/staging/lustre/lustre/obdclass/genops.c
@@ -171,13 +171,13 @@ int class_register_type(struct obd_ops *
 	}
 
 	rc = -ENOMEM;
-	OBD_ALLOC(type, sizeof(*type));
+	type = kzalloc(sizeof(*type), GFP_NOFS);
 	if (type = NULL)
 		return rc;
 
-	OBD_ALLOC_PTR(type->typ_dt_ops);
-	OBD_ALLOC_PTR(type->typ_md_ops);
-	OBD_ALLOC(type->typ_name, strlen(name) + 1);
+	type->typ_dt_ops = kzalloc(sizeof(*type->typ_dt_ops), GFP_NOFS);
+	type->typ_md_ops = kzalloc(sizeof(*type->typ_md_ops), GFP_NOFS);
+	type->typ_name = kzalloc(strlen(name) + 1, GFP_NOFS);
 
 	if (type->typ_dt_ops = NULL ||
 	    type->typ_md_ops = NULL ||
@@ -214,12 +214,12 @@ int class_register_type(struct obd_ops *
 
  failed:
 	if (type->typ_name != NULL)
-		OBD_FREE(type->typ_name, strlen(name) + 1);
+		kfree(type->typ_name);
 	if (type->typ_md_ops != NULL)
-		OBD_FREE_PTR(type->typ_md_ops);
+		kfree(type->typ_md_ops);
 	if (type->typ_dt_ops != NULL)
-		OBD_FREE_PTR(type->typ_dt_ops);
-	OBD_FREE(type, sizeof(*type));
+		kfree(type->typ_dt_ops);
+	kfree(type);
 	return rc;
 }
 EXPORT_SYMBOL(class_register_type);
@@ -237,8 +237,8 @@ int class_unregister_type(const char *na
 		CERROR("type %s has refcount (%d)\n", name, type->typ_refcnt);
 		/* This is a bad situation, let's make the best of it */
 		/* Remove ops, but leave the name for debugging */
-		OBD_FREE_PTR(type->typ_dt_ops);
-		OBD_FREE_PTR(type->typ_md_ops);
+		kfree(type->typ_dt_ops);
+		kfree(type->typ_md_ops);
 		return -EBUSY;
 	}
 
@@ -252,12 +252,12 @@ int class_unregister_type(const char *na
 	spin_lock(&obd_types_lock);
 	list_del(&type->typ_chain);
 	spin_unlock(&obd_types_lock);
-	OBD_FREE(type->typ_name, strlen(name) + 1);
+	kfree(type->typ_name);
 	if (type->typ_dt_ops != NULL)
-		OBD_FREE_PTR(type->typ_dt_ops);
+		kfree(type->typ_dt_ops);
 	if (type->typ_md_ops != NULL)
-		OBD_FREE_PTR(type->typ_md_ops);
-	OBD_FREE(type, sizeof(*type));
+		kfree(type->typ_md_ops);
+	kfree(type);
 	return 0;
 } /* class_unregister_type */
 EXPORT_SYMBOL(class_unregister_type);
@@ -819,7 +819,7 @@ struct obd_export *class_new_export(stru
 	struct cfs_hash *hash = NULL;
 	int rc = 0;
 
-	OBD_ALLOC_PTR(export);
+	export = kzalloc(sizeof(*export), GFP_NOFS);
 	if (!export)
 		return ERR_PTR(-ENOMEM);
 
@@ -904,7 +904,7 @@ exit_err:
 	class_handle_unhash(&export->exp_handle);
 	LASSERT(hlist_unhashed(&export->exp_uuid_hash));
 	obd_destroy_export(export);
-	OBD_FREE_PTR(export);
+	kfree(export);
 	return ERR_PTR(rc);
 }
 EXPORT_SYMBOL(class_new_export);
@@ -945,7 +945,7 @@ static void class_import_destroy(struct
 					  struct obd_import_conn, oic_item);
 		list_del_init(&imp_conn->oic_item);
 		ptlrpc_put_connection_superhack(imp_conn->oic_conn);
-		OBD_FREE(imp_conn, sizeof(*imp_conn));
+		kfree(imp_conn);
 	}
 
 	LASSERT(imp->imp_sec = NULL);
@@ -1008,7 +1008,7 @@ struct obd_import *class_new_import(stru
 {
 	struct obd_import *imp;
 
-	OBD_ALLOC(imp, sizeof(*imp));
+	imp = kzalloc(sizeof(*imp), GFP_NOFS);
 	if (imp = NULL)
 		return NULL;
 
@@ -1811,7 +1811,7 @@ void *kuc_alloc(int payload_len, int tra
 	struct kuc_hdr *lh;
 	int len = kuc_len(payload_len);
 
-	OBD_ALLOC(lh, len);
+	lh = kzalloc(len, GFP_NOFS);
 	if (lh = NULL)
 		return ERR_PTR(-ENOMEM);
 
@@ -1828,6 +1828,6 @@ EXPORT_SYMBOL(kuc_alloc);
 inline void kuc_free(void *p, int payload_len)
 {
 	struct kuc_hdr *lh = kuc_ptr(p);
-	OBD_FREE(lh, kuc_len(payload_len));
+	kfree(lh);
 }
 EXPORT_SYMBOL(kuc_free);
diff -u -p a/drivers/staging/lustre/lustre/obdclass/class_obd.c b/drivers/staging/lustre/lustre/obdclass/class_obd.c
--- a/drivers/staging/lustre/lustre/obdclass/class_obd.c
+++ b/drivers/staging/lustre/lustre/obdclass/class_obd.c
@@ -231,7 +231,7 @@ int class_handle_ioctl(unsigned int cmd,
 			err = -EINVAL;
 			goto out;
 		}
-		OBD_ALLOC(lcfg, data->ioc_plen1);
+		lcfg = kzalloc(data->ioc_plen1, GFP_NOFS);
 		if (lcfg = NULL) {
 			err = -ENOMEM;
 			goto out;
@@ -243,7 +243,7 @@ int class_handle_ioctl(unsigned int cmd,
 		if (!err)
 			err = class_process_config(lcfg);
 
-		OBD_FREE(lcfg, data->ioc_plen1);
+		kfree(lcfg);
 		goto out;
 	}
 
diff -u -p a/drivers/staging/lustre/lustre/obdclass/cl_page.c b/drivers/staging/lustre/lustre/obdclass/cl_page.c
--- a/drivers/staging/lustre/lustre/obdclass/cl_page.c
+++ b/drivers/staging/lustre/lustre/obdclass/cl_page.c
@@ -270,7 +270,7 @@ static void cl_page_free(const struct lu
 	lu_object_ref_del_at(&obj->co_lu, &page->cp_obj_ref, "cl_page", page);
 	cl_object_put(env, obj);
 	lu_ref_fini(&page->cp_reference);
-	OBD_FREE(page, pagesize);
+	kfree(page);
 }
 
 /**
diff -u -p a/drivers/staging/lustre/lustre/obdclass/cl_io.c b/drivers/staging/lustre/lustre/obdclass/cl_io.c
--- a/drivers/staging/lustre/lustre/obdclass/cl_io.c
+++ b/drivers/staging/lustre/lustre/obdclass/cl_io.c
@@ -612,7 +612,7 @@ EXPORT_SYMBOL(cl_io_lock_add);
 static void cl_free_io_lock_link(const struct lu_env *env,
 				 struct cl_io_lock_link *link)
 {
-	OBD_FREE_PTR(link);
+	kfree(link);
 }
 
 /**
@@ -624,7 +624,7 @@ int cl_io_lock_alloc_add(const struct lu
 	struct cl_io_lock_link *link;
 	int result;
 
-	OBD_ALLOC_PTR(link);
+	link = kzalloc(sizeof(*link), GFP_NOFS);
 	if (link != NULL) {
 		link->cill_descr     = *descr;
 		link->cill_fini      = cl_free_io_lock_link;
@@ -1387,9 +1387,9 @@ static void cl_req_free(const struct lu_
 				cl_object_put(env, obj);
 			}
 		}
-		OBD_FREE(req->crq_o, req->crq_nrobjs * sizeof(req->crq_o[0]));
+		kfree(req->crq_o);
 	}
-	OBD_FREE_PTR(req);
+	kfree(req);
 }
 
 static int cl_req_init(const struct lu_env *env, struct cl_req *req,
@@ -1448,7 +1448,7 @@ struct cl_req *cl_req_alloc(const struct
 
 	LINVRNT(nr_objects > 0);
 
-	OBD_ALLOC_PTR(req);
+	req = kzalloc(sizeof(*req), GFP_NOFS);
 	if (req != NULL) {
 		int result;
 
@@ -1456,7 +1456,8 @@ struct cl_req *cl_req_alloc(const struct
 		INIT_LIST_HEAD(&req->crq_pages);
 		INIT_LIST_HEAD(&req->crq_layers);
 
-		OBD_ALLOC(req->crq_o, nr_objects * sizeof(req->crq_o[0]));
+		req->crq_o = kcalloc(nr_objects, sizeof(req->crq_o[0]),
+				     GFP_NOFS);
 		if (req->crq_o != NULL) {
 			req->crq_nrobjs = nr_objects;
 			result = cl_req_init(env, req, page);
diff -u -p a/drivers/staging/lustre/lustre/obdclass/capa.c b/drivers/staging/lustre/lustre/obdclass/capa.c
--- a/drivers/staging/lustre/lustre/obdclass/capa.c
+++ b/drivers/staging/lustre/lustre/obdclass/capa.c
@@ -87,7 +87,7 @@ struct hlist_head *init_capa_hash(void)
 	struct hlist_head *hash;
 	int nr_hash, i;
 
-	OBD_ALLOC(hash, PAGE_CACHE_SIZE);
+	hash = kzalloc(PAGE_CACHE_SIZE, GFP_NOFS);
 	if (!hash)
 		return NULL;
 
@@ -129,7 +129,7 @@ void cleanup_capa_hash(struct hlist_head
 	}
 	spin_unlock(&capa_lock);
 
-	OBD_FREE(hash, PAGE_CACHE_SIZE);
+	kfree(hash);
 }
 EXPORT_SYMBOL(cleanup_capa_hash);
 
diff -u -p a/drivers/staging/lustre/lustre/obdclass/acl.c b/drivers/staging/lustre/lustre/obdclass/acl.c
--- a/drivers/staging/lustre/lustre/obdclass/acl.c
+++ b/drivers/staging/lustre/lustre/obdclass/acl.c
@@ -104,12 +104,12 @@ static int lustre_posix_acl_xattr_reduce
 	if (unlikely(old_count <= new_count))
 		return old_size;
 
-	OBD_ALLOC(new, new_size);
+	new = kzalloc(new_size, GFP_NOFS);
 	if (unlikely(new = NULL))
 		return -ENOMEM;
 
 	memcpy(new, *header, new_size);
-	OBD_FREE(*header, old_size);
+	kfree(*header);
 	*header = new;
 	return new_size;
 }
@@ -126,12 +126,12 @@ static int lustre_ext_acl_xattr_reduce_s
 	if (unlikely(old_count <= ext_count))
 		return 0;
 
-	OBD_ALLOC(new, ext_size);
+	new = kzalloc(ext_size, GFP_NOFS);
 	if (unlikely(new = NULL))
 		return -ENOMEM;
 
 	memcpy(new, *header, ext_size);
-	OBD_FREE(*header, old_size);
+	kfree(*header);
 	*header = new;
 	return 0;
 }
@@ -152,7 +152,7 @@ lustre_posix_acl_xattr_2ext(posix_acl_xa
 	else
 		count = CFS_ACL_XATTR_COUNT(size, posix_acl_xattr);
 	esize = CFS_ACL_XATTR_SIZE(count, ext_acl_xattr);
-	OBD_ALLOC(new, esize);
+	new = kzalloc(esize, GFP_NOFS);
 	if (unlikely(new = NULL))
 		return ERR_PTR(-ENOMEM);
 
@@ -183,7 +183,7 @@ int lustre_posix_acl_xattr_filter(posix_
 	if (size < sizeof(*new))
 		return -EINVAL;
 
-	OBD_ALLOC(new, size);
+	new = kzalloc(size, GFP_NOFS);
 	if (unlikely(new = NULL))
 		return -ENOMEM;
 
@@ -232,7 +232,7 @@ int lustre_posix_acl_xattr_filter(posix_
 
 _out:
 	if (rc) {
-		OBD_FREE(new, size);
+		kfree(new);
 		size = rc;
 	}
 	return size;
@@ -244,7 +244,7 @@ EXPORT_SYMBOL(lustre_posix_acl_xattr_fil
  */
 void lustre_posix_acl_xattr_free(posix_acl_xattr_header *header, int size)
 {
-	OBD_FREE(header, size);
+	kfree(header);
 }
 EXPORT_SYMBOL(lustre_posix_acl_xattr_free);
 
@@ -253,8 +253,7 @@ EXPORT_SYMBOL(lustre_posix_acl_xattr_fre
  */
 void lustre_ext_acl_xattr_free(ext_acl_xattr_header *header)
 {
-	OBD_FREE(header, CFS_ACL_XATTR_SIZE(le32_to_cpu(header->a_count), \
-					    ext_acl_xattr));
+	kfree(header);
 }
 EXPORT_SYMBOL(lustre_ext_acl_xattr_free);
 
@@ -309,7 +308,7 @@ int lustre_acl_xattr_merge2posix(posix_a
 		/* there are only base ACL entries at most. */
 		posix_count = 3;
 		posix_size = CFS_ACL_XATTR_SIZE(posix_count, posix_acl_xattr);
-		OBD_ALLOC(new, posix_size);
+		new = kzalloc(posix_size, GFP_NOFS);
 		if (unlikely(new = NULL))
 			return -ENOMEM;
 
@@ -360,7 +359,7 @@ int lustre_acl_xattr_merge2posix(posix_a
 		posix_count = ori_posix_count + ext_count;
 		posix_size  			CFS_ACL_XATTR_SIZE(posix_count, posix_acl_xattr);
-		OBD_ALLOC(new, posix_size);
+		new = kzalloc(posix_size, GFP_NOFS);
 		if (unlikely(new = NULL))
 			return -ENOMEM;
 
@@ -402,7 +401,7 @@ int lustre_acl_xattr_merge2posix(posix_a
 
 _out:
 	if (rc) {
-		OBD_FREE(new, posix_size);
+		kfree(new);
 		posix_size = rc;
 	}
 	return posix_size;
@@ -432,7 +431,7 @@ lustre_acl_xattr_merge2ext(posix_acl_xat
 	ext_count = posix_count + ori_ext_count;
 	ext_size = CFS_ACL_XATTR_SIZE(ext_count, ext_acl_xattr);
 
-	OBD_ALLOC(new, ext_size);
+	new = kzalloc(ext_size, GFP_NOFS);
 	if (unlikely(new = NULL))
 		return ERR_PTR(-ENOMEM);
 
@@ -538,7 +537,7 @@ lustre_acl_xattr_merge2ext(posix_acl_xat
 
 out:
 	if (rc) {
-		OBD_FREE(new, ext_size);
+		kfree(new);
 		new = ERR_PTR(rc);
 	}
 	return new;

