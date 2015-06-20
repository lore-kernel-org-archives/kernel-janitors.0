From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:04 +0000
Subject: [PATCH 06/12] staging: lustre: lov: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-7-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/lov/lov_dev.c     |    2 +-
 drivers/staging/lustre/lustre/lov/lov_io.c      |    2 +-
 drivers/staging/lustre/lustre/lov/lov_obd.c     |    2 +-
 drivers/staging/lustre/lustre/lov/lov_pool.c    |    2 +-
 drivers/staging/lustre/lustre/lov/lov_request.c |   18 +++++++++---------
 5 files changed, 13 insertions(+), 13 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/lov/lov_request.c b/drivers/staging/lustre/lustre/lov/lov_request.c
--- a/drivers/staging/lustre/lustre/lov/lov_request.c
+++ b/drivers/staging/lustre/lustre/lov/lov_request.c
@@ -275,7 +275,7 @@ int lov_prep_getattr_set(struct obd_expo
 	int rc = 0, i;
 
 	set = kzalloc(sizeof(*set), GFP_NOFS);
-	if (set = NULL)
+	if (!set)
 		return -ENOMEM;
 	lov_init_set(set);
 
@@ -301,7 +301,7 @@ int lov_prep_getattr_set(struct obd_expo
 		}
 
 		req = kzalloc(sizeof(*req), GFP_NOFS);
-		if (req = NULL) {
+		if (!req) {
 			rc = -ENOMEM;
 			goto out_set;
 		}
@@ -358,7 +358,7 @@ int lov_prep_destroy_set(struct obd_expo
 	int rc = 0, i;
 
 	set = kzalloc(sizeof(*set), GFP_NOFS);
-	if (set = NULL)
+	if (!set)
 		return -ENOMEM;
 	lov_init_set(set);
 
@@ -384,7 +384,7 @@ int lov_prep_destroy_set(struct obd_expo
 		}
 
 		req = kzalloc(sizeof(*req), GFP_NOFS);
-		if (req = NULL) {
+		if (!req) {
 			rc = -ENOMEM;
 			goto out_set;
 		}
@@ -477,7 +477,7 @@ int lov_prep_setattr_set(struct obd_expo
 	int rc = 0, i;
 
 	set = kzalloc(sizeof(*set), GFP_NOFS);
-	if (set = NULL)
+	if (!set)
 		return -ENOMEM;
 	lov_init_set(set);
 
@@ -500,7 +500,7 @@ int lov_prep_setattr_set(struct obd_expo
 		}
 
 		req = kzalloc(sizeof(*req), GFP_NOFS);
-		if (req = NULL) {
+		if (!req) {
 			rc = -ENOMEM;
 			goto out_set;
 		}
@@ -704,7 +704,7 @@ int lov_prep_statfs_set(struct obd_devic
 	int rc = 0, i;
 
 	set = kzalloc(sizeof(*set), GFP_NOFS);
-	if (set = NULL)
+	if (!set)
 		return -ENOMEM;
 	lov_init_set(set);
 
@@ -730,14 +730,14 @@ int lov_prep_statfs_set(struct obd_devic
 		}
 
 		req = kzalloc(sizeof(*req), GFP_NOFS);
-		if (req = NULL) {
+		if (!req) {
 			rc = -ENOMEM;
 			goto out_set;
 		}
 
 		req->rq_oi.oi_osfs = kzalloc(sizeof(*req->rq_oi.oi_osfs),
 					     GFP_NOFS);
-		if (req->rq_oi.oi_osfs = NULL) {
+		if (!req->rq_oi.oi_osfs) {
 			kfree(req);
 			rc = -ENOMEM;
 			goto out_set;
diff -u -p a/drivers/staging/lustre/lustre/lov/lov_pool.c b/drivers/staging/lustre/lustre/lov/lov_pool.c
--- a/drivers/staging/lustre/lustre/lov/lov_pool.c
+++ b/drivers/staging/lustre/lustre/lov/lov_pool.c
@@ -431,7 +431,7 @@ int lov_pool_new(struct obd_device *obd,
 		return -ENAMETOOLONG;
 
 	new_pool = kzalloc(sizeof(*new_pool), GFP_NOFS);
-	if (new_pool = NULL)
+	if (!new_pool)
 		return -ENOMEM;
 
 	strncpy(new_pool->pool_name, poolname, LOV_MAXPOOLNAME);
diff -u -p a/drivers/staging/lustre/lustre/lov/lov_obd.c b/drivers/staging/lustre/lustre/lov/lov_obd.c
--- a/drivers/staging/lustre/lustre/lov/lov_obd.c
+++ b/drivers/staging/lustre/lustre/lov/lov_obd.c
@@ -976,7 +976,7 @@ static int lov_recreate(struct obd_expor
 		src_oa->o_flags & OBD_FL_RECREATE_OBJS);
 
 	obj_mdp = kzalloc(sizeof(*obj_mdp), GFP_NOFS);
-	if (obj_mdp = NULL)
+	if (!obj_mdp)
 		return -ENOMEM;
 
 	ost_idx = src_oa->o_nlink;
diff -u -p a/drivers/staging/lustre/lustre/lov/lov_io.c b/drivers/staging/lustre/lustre/lov/lov_io.c
--- a/drivers/staging/lustre/lustre/lov/lov_io.c
+++ b/drivers/staging/lustre/lustre/lov/lov_io.c
@@ -181,7 +181,7 @@ static int lov_io_sub_init(const struct
 			} else {
 				sub->sub_io = kzalloc(sizeof(*sub->sub_io),
 						      GFP_NOFS);
-				if (sub->sub_io = NULL)
+				if (!sub->sub_io)
 					result = -ENOMEM;
 			}
 		}
diff -u -p a/drivers/staging/lustre/lustre/lov/lov_dev.c b/drivers/staging/lustre/lustre/lov/lov_dev.c
--- a/drivers/staging/lustre/lustre/lov/lov_dev.c
+++ b/drivers/staging/lustre/lustre/lov/lov_dev.c
@@ -478,7 +478,7 @@ static struct lu_device *lov_device_allo
 	int rc;
 
 	ld = kzalloc(sizeof(*ld), GFP_NOFS);
-	if (ld = NULL)
+	if (!ld)
 		return ERR_PTR(-ENOMEM);
 
 	cl_device_init(&ld->ld_cl, t);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
