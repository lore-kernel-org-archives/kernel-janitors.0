From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Jun 2018 13:16:59 +0000
Subject: [PATCH] ocfs2: make several functions and variables static (and some const)
Message-Id: <20180628131659.12133-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Andrew Morton <akpm@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a variety of functions and variables that are local to the
source and do not need to be in global scope, so make them static. Also
make a couple of char arrays static const.

Cleans up sparse warnings:
symbol 'o2hb_heartbeat_mode_desc' was not declared. Should it be static?
symbol 'o2hb_heartbeat_mode' was not declared. Should it be static?
symbol 'o2hb_dependent_users' was not declared. Should it be static?
symbol 'o2hb_region_dec_user' was not declared. Should it be static?
symbol 'o2nm_fence_method_desc' was not declared. Should it be static?
symbol 'lockdep_keys' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/cluster/heartbeat.c   | 12 ++++++------
 fs/ocfs2/cluster/nodemanager.c |  6 +++---
 fs/ocfs2/dlmglue.c             |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index ea8c551bcd7e..9b2ed62dd638 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -127,13 +127,13 @@ enum o2hb_heartbeat_modes {
 	O2HB_HEARTBEAT_NUM_MODES,
 };
 
-char *o2hb_heartbeat_mode_desc[O2HB_HEARTBEAT_NUM_MODES] = {
-		"local",	/* O2HB_HEARTBEAT_LOCAL */
-		"global",	/* O2HB_HEARTBEAT_GLOBAL */
+static const char *o2hb_heartbeat_mode_desc[O2HB_HEARTBEAT_NUM_MODES] = {
+	"local",	/* O2HB_HEARTBEAT_LOCAL */
+	"global",	/* O2HB_HEARTBEAT_GLOBAL */
 };
 
 unsigned int o2hb_dead_threshold = O2HB_DEFAULT_DEAD_THRESHOLD;
-unsigned int o2hb_heartbeat_mode = O2HB_HEARTBEAT_LOCAL;
+static unsigned int o2hb_heartbeat_mode = O2HB_HEARTBEAT_LOCAL;
 
 /*
  * o2hb_dependent_users tracks the number of registered callbacks that depend
@@ -141,7 +141,7 @@ unsigned int o2hb_heartbeat_mode = O2HB_HEARTBEAT_LOCAL;
  * However only o2dlm depends on the heartbeat. It does not want the heartbeat
  * to stop while a dlm domain is still active.
  */
-unsigned int o2hb_dependent_users;
+static unsigned int o2hb_dependent_users;
 
 /*
  * In global heartbeat mode, all regions are pinned if there are one or more
@@ -2486,7 +2486,7 @@ static int o2hb_region_inc_user(const char *region_uuid)
 	return ret;
 }
 
-void o2hb_region_dec_user(const char *region_uuid)
+static void o2hb_region_dec_user(const char *region_uuid)
 {
 	spin_lock(&o2hb_live_lock);
 
diff --git a/fs/ocfs2/cluster/nodemanager.c b/fs/ocfs2/cluster/nodemanager.c
index da64c3a20eeb..0e4166cc23a0 100644
--- a/fs/ocfs2/cluster/nodemanager.c
+++ b/fs/ocfs2/cluster/nodemanager.c
@@ -35,9 +35,9 @@
  * cluster references throughout where nodes are looked up */
 struct o2nm_cluster *o2nm_single_cluster = NULL;
 
-char *o2nm_fence_method_desc[O2NM_FENCE_METHODS] = {
-		"reset",	/* O2NM_FENCE_RESET */
-		"panic",	/* O2NM_FENCE_PANIC */
+static const char *o2nm_fence_method_desc[O2NM_FENCE_METHODS] = {
+	"reset",	/* O2NM_FENCE_RESET */
+	"panic",	/* O2NM_FENCE_PANIC */
 };
 
 static inline void o2nm_lock_subsystem(void);
diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index 5502a5e8f0d9..97897211298a 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -96,7 +96,7 @@ struct ocfs2_unblock_ctl {
 };
 
 /* Lockdep class keys */
-struct lock_class_key lockdep_keys[OCFS2_NUM_LOCK_TYPES];
+static struct lock_class_key lockdep_keys[OCFS2_NUM_LOCK_TYPES];
 
 static int ocfs2_check_meta_downconvert(struct ocfs2_lock_res *lockres,
 					int new_level);
-- 
2.17.1

