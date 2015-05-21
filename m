From: Mike Shuey <shuey@purdue.edu>
Date: Thu, 21 May 2015 19:50:31 +0000
Subject: [PATCH v4 08/13] staging: lustre: lnet: remove LNET_MUTEX_LOCK macro
Message-Id: <1432237849-53947-9-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org, Mike Shuey <shuey@purdue.edu>

LNET_MUTEX_LOCK and LNET_MUTEX_UNLOCK are verbose wrappers to mutex_lock and
mutex_unlock.  Get rid of these.

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 .../staging/lustre/include/linux/lnet/lib-lnet.h   |    2 -
 drivers/staging/lustre/lnet/lnet/api-ni.c          |   26 ++++++++++----------
 drivers/staging/lustre/lnet/lnet/module.c          |   12 ++++----
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/lustre/include/linux/lnet/lib-lnet.h b/drivers/staging/lustre/include/linux/lnet/lib-lnet.h
index 0038d29..d84aa9a 100644
--- a/drivers/staging/lustre/include/linux/lnet/lib-lnet.h
+++ b/drivers/staging/lustre/include/linux/lnet/lib-lnet.h
@@ -172,8 +172,6 @@ lnet_net_lock_current(void)
 #define lnet_eq_wait_unlock()	spin_unlock(&the_lnet.ln_eq_wait_lock)
 #define lnet_ni_lock(ni)	spin_lock(&(ni)->ni_lock)
 #define lnet_ni_unlock(ni)	spin_unlock(&(ni)->ni_lock)
-#define LNET_MUTEX_LOCK(m)	mutex_lock(m)
-#define LNET_MUTEX_UNLOCK(m)	mutex_unlock(m)
 
 #define MAX_PORTALS     64
 
diff --git a/drivers/staging/lustre/lnet/lnet/api-ni.c b/drivers/staging/lustre/lnet/lnet/api-ni.c
index 1adc481..2230eb0 100644
--- a/drivers/staging/lustre/lnet/lnet/api-ni.c
+++ b/drivers/staging/lustre/lnet/lnet/api-ni.c
@@ -282,7 +282,7 @@ lnet_find_lnd_by_type(int type)
 void
 lnet_register_lnd(lnd_t *lnd)
 {
-	LNET_MUTEX_LOCK(&the_lnet.ln_lnd_mutex);
+	mutex_lock(&the_lnet.ln_lnd_mutex);
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(libcfs_isknown_lnd(lnd->lnd_type));
@@ -293,14 +293,14 @@ lnet_register_lnd(lnd_t *lnd)
 
 	CDEBUG(D_NET, "%s LND registered\n", libcfs_lnd2str(lnd->lnd_type));
 
-	LNET_MUTEX_UNLOCK(&the_lnet.ln_lnd_mutex);
+	mutex_unlock(&the_lnet.ln_lnd_mutex);
 }
 EXPORT_SYMBOL(lnet_register_lnd);
 
 void
 lnet_unregister_lnd(lnd_t *lnd)
 {
-	LNET_MUTEX_LOCK(&the_lnet.ln_lnd_mutex);
+	mutex_lock(&the_lnet.ln_lnd_mutex);
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(lnet_find_lnd_by_type(lnd->lnd_type) = lnd);
@@ -309,7 +309,7 @@ lnet_unregister_lnd(lnd_t *lnd)
 	list_del(&lnd->lnd_list);
 	CDEBUG(D_NET, "%s LND unregistered\n", libcfs_lnd2str(lnd->lnd_type));
 
-	LNET_MUTEX_UNLOCK(&the_lnet.ln_lnd_mutex);
+	mutex_unlock(&the_lnet.ln_lnd_mutex);
 }
 EXPORT_SYMBOL(lnet_unregister_lnd);
 
@@ -1055,18 +1055,18 @@ lnet_startup_lndnis(void)
 			goto failed;
 		}
 
-		LNET_MUTEX_LOCK(&the_lnet.ln_lnd_mutex);
+		mutex_lock(&the_lnet.ln_lnd_mutex);
 		lnd = lnet_find_lnd_by_type(lnd_type);
 
 		if (lnd = NULL) {
-			LNET_MUTEX_UNLOCK(&the_lnet.ln_lnd_mutex);
+			mutex_unlock(&the_lnet.ln_lnd_mutex);
 			rc = request_module("%s",
 						libcfs_lnd2modname(lnd_type));
-			LNET_MUTEX_LOCK(&the_lnet.ln_lnd_mutex);
+			mutex_lock(&the_lnet.ln_lnd_mutex);
 
 			lnd = lnet_find_lnd_by_type(lnd_type);
 			if (lnd = NULL) {
-				LNET_MUTEX_UNLOCK(&the_lnet.ln_lnd_mutex);
+				mutex_unlock(&the_lnet.ln_lnd_mutex);
 				CERROR("Can't load LND %s, module %s, rc=%d\n",
 				       libcfs_lnd2str(lnd_type),
 				       libcfs_lnd2modname(lnd_type), rc);
@@ -1082,7 +1082,7 @@ lnet_startup_lndnis(void)
 
 		rc = (lnd->lnd_startup)(ni);
 
-		LNET_MUTEX_UNLOCK(&the_lnet.ln_lnd_mutex);
+		mutex_unlock(&the_lnet.ln_lnd_mutex);
 
 		if (rc != 0) {
 			LCONSOLE_ERROR_MSG(0x105, "Error %d starting up LNI %s\n",
@@ -1272,7 +1272,7 @@ LNetNIInit(lnet_pid_t requested_pid)
 	int im_a_router = 0;
 	int rc;
 
-	LNET_MUTEX_LOCK(&the_lnet.ln_api_mutex);
+	mutex_lock(&the_lnet.ln_api_mutex);
 
 	LASSERT(the_lnet.ln_init);
 	CDEBUG(D_OTHER, "refs %d\n", the_lnet.ln_refcount);
@@ -1343,7 +1343,7 @@ LNetNIInit(lnet_pid_t requested_pid)
  failed0:
 	LASSERT(rc < 0);
  out:
-	LNET_MUTEX_UNLOCK(&the_lnet.ln_api_mutex);
+	mutex_unlock(&the_lnet.ln_api_mutex);
 	return rc;
 }
 EXPORT_SYMBOL(LNetNIInit);
@@ -1360,7 +1360,7 @@ EXPORT_SYMBOL(LNetNIInit);
 int
 LNetNIFini(void)
 {
-	LNET_MUTEX_LOCK(&the_lnet.ln_api_mutex);
+	mutex_lock(&the_lnet.ln_api_mutex);
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
@@ -1383,7 +1383,7 @@ LNetNIFini(void)
 		lnet_unprepare();
 	}
 
-	LNET_MUTEX_UNLOCK(&the_lnet.ln_api_mutex);
+	mutex_unlock(&the_lnet.ln_api_mutex);
 	return 0;
 }
 EXPORT_SYMBOL(LNetNIFini);
diff --git a/drivers/staging/lustre/lnet/lnet/module.c b/drivers/staging/lustre/lnet/lnet/module.c
index f73d644..6881b9c 100644
--- a/drivers/staging/lustre/lnet/lnet/module.c
+++ b/drivers/staging/lustre/lnet/lnet/module.c
@@ -49,7 +49,7 @@ lnet_configure(void *arg)
 	/* 'arg' only there so I can be passed to cfs_create_thread() */
 	int rc = 0;
 
-	LNET_MUTEX_LOCK(&lnet_config_mutex);
+	mutex_lock(&lnet_config_mutex);
 
 	if (!the_lnet.ln_niinit_self) {
 		rc = LNetNIInit(LUSTRE_SRV_LNET_PID);
@@ -59,7 +59,7 @@ lnet_configure(void *arg)
 		}
 	}
 
-	LNET_MUTEX_UNLOCK(&lnet_config_mutex);
+	mutex_unlock(&lnet_config_mutex);
 	return rc;
 }
 
@@ -68,18 +68,18 @@ lnet_unconfigure(void)
 {
 	int refcount;
 
-	LNET_MUTEX_LOCK(&lnet_config_mutex);
+	mutex_lock(&lnet_config_mutex);
 
 	if (the_lnet.ln_niinit_self) {
 		the_lnet.ln_niinit_self = 0;
 		LNetNIFini();
 	}
 
-	LNET_MUTEX_LOCK(&the_lnet.ln_api_mutex);
+	mutex_lock(&the_lnet.ln_api_mutex);
 	refcount = the_lnet.ln_refcount;
-	LNET_MUTEX_UNLOCK(&the_lnet.ln_api_mutex);
+	mutex_unlock(&the_lnet.ln_api_mutex);
 
-	LNET_MUTEX_UNLOCK(&lnet_config_mutex);
+	mutex_unlock(&lnet_config_mutex);
 	return (refcount = 0) ? 0 : -EBUSY;
 }
 
-- 
1.7.1

