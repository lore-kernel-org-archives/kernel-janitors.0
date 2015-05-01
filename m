From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:37:52 +0000
Subject: [PATCH 15/20] staging: lustre: obdclass: obd_mount: remove unneeded null test before free
Message-Id: <1430509086-22132-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Kfree can cope with a null argument, so drop null tests.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr; @@

- if (ptr != NULL)
  kfree(ptr);

@@ expression ptr; @@

- if (ptr != NULL) {
  kfree(ptr);
  ptr = NULL;
- }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/obd_mount.c |   45 +++++++--------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/obd_mount.c b/drivers/staging/lustre/lustre/obdclass/obd_mount.c
index 04a22169..1f9a5f7 100644
--- a/drivers/staging/lustre/lustre/obdclass/obd_mount.c
+++ b/drivers/staging/lustre/lustre/obdclass/obd_mount.c
@@ -464,12 +464,9 @@ out:
 out_free:
 	mutex_unlock(&mgc_start_lock);
 
-	if (data)
-		kfree(data);
-	if (mgcname)
-		kfree(mgcname);
-	if (niduuid)
-		kfree(niduuid);
+	kfree(data);
+	kfree(mgcname);
+	kfree(niduuid);
 	return rc;
 }
 
@@ -538,8 +535,7 @@ static int lustre_stop_mgc(struct super_block *sb)
 			       niduuid, rc);
 	}
 out:
-	if (niduuid)
-		kfree(niduuid);
+	kfree(niduuid);
 
 	/* class_import_put will get rid of the additional connections */
 	mutex_unlock(&mgc_start_lock);
@@ -585,22 +581,15 @@ static int lustre_free_lsi(struct super_block *sb)
 	LASSERT(atomic_read(&lsi->lsi_mounts) = 0);
 
 	if (lsi->lsi_lmd != NULL) {
-		if (lsi->lsi_lmd->lmd_dev != NULL)
-			kfree(lsi->lsi_lmd->lmd_dev);
-		if (lsi->lsi_lmd->lmd_profile != NULL)
-			kfree(lsi->lsi_lmd->lmd_profile);
-		if (lsi->lsi_lmd->lmd_mgssec != NULL)
-			kfree(lsi->lsi_lmd->lmd_mgssec);
-		if (lsi->lsi_lmd->lmd_opts != NULL)
-			kfree(lsi->lsi_lmd->lmd_opts);
+		kfree(lsi->lsi_lmd->lmd_dev);
+		kfree(lsi->lsi_lmd->lmd_profile);
+		kfree(lsi->lsi_lmd->lmd_mgssec);
+		kfree(lsi->lsi_lmd->lmd_opts);
 		if (lsi->lsi_lmd->lmd_exclude_count)
 			kfree(lsi->lsi_lmd->lmd_exclude);
-		if (lsi->lsi_lmd->lmd_mgs != NULL)
-			kfree(lsi->lsi_lmd->lmd_mgs);
-		if (lsi->lsi_lmd->lmd_osd_type != NULL)
-			kfree(lsi->lsi_lmd->lmd_osd_type);
-		if (lsi->lsi_lmd->lmd_params != NULL)
-			kfree(lsi->lsi_lmd->lmd_params);
+		kfree(lsi->lsi_lmd->lmd_mgs);
+		kfree(lsi->lsi_lmd->lmd_osd_type);
+		kfree(lsi->lsi_lmd->lmd_params);
 
 		kfree(lsi->lsi_lmd);
 	}
@@ -886,10 +875,8 @@ static int lmd_parse_mgssec(struct lustre_mount_data *lmd, char *ptr)
 	char   *tail;
 	int     length;
 
-	if (lmd->lmd_mgssec != NULL) {
-		kfree(lmd->lmd_mgssec);
-		lmd->lmd_mgssec = NULL;
-	}
+	kfree(lmd->lmd_mgssec);
+	lmd->lmd_mgssec = NULL;
 
 	tail = strchr(ptr, ',');
 	if (tail = NULL)
@@ -914,10 +901,8 @@ static int lmd_parse_string(char **handle, char *ptr)
 	if ((handle = NULL) || (ptr = NULL))
 		return -EINVAL;
 
-	if (*handle != NULL) {
-		kfree(*handle);
-		*handle = NULL;
-	}
+	kfree(*handle);
+	*handle = NULL;
 
 	tail = strchr(ptr, ',');
 	if (tail = NULL)

