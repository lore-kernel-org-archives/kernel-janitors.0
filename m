From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sat, 04 Mar 2006 19:09:41 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/md
Message-Id: <1141499381.30193.13.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69239587962955051=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============69239587962955051==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/md to kzalloc usage.
Compile tested with allyes config.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/md/dm-path-selector.c.orig	2006-03-04 19:25:41.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/md/dm-path-selector.c	2006-03-04 19:26:08.000000000 +0100
@@ -95,12 +95,10 @@ out:
 
 static struct ps_internal *_alloc_path_selector(struct path_selector_type *pst)
 {
-	struct ps_internal *psi = kmalloc(sizeof(*psi), GFP_KERNEL);
+	struct ps_internal *psi = kzalloc(sizeof(*psi), GFP_KERNEL);
 
-	if (psi) {
-		memset(psi, 0, sizeof(*psi));
+	if (psi) 
 		psi->pst = *pst;
-	}
 
 	return psi;
 }
--- linux-2.6.16-rc5-mm1/drivers/md/dm-hw-handler.c.orig	2006-03-04 19:26:17.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/md/dm-hw-handler.c	2006-03-04 19:26:30.000000000 +0100
@@ -92,12 +92,10 @@ void dm_put_hw_handler(struct hw_handler
 
 static struct hwh_internal *_alloc_hw_handler(struct hw_handler_type *hwht)
 {
-	struct hwh_internal *hwhi = kmalloc(sizeof(*hwhi), GFP_KERNEL);
+	struct hwh_internal *hwhi = kzalloc(sizeof(*hwhi), GFP_KERNEL);
 
-	if (hwhi) {
-		memset(hwhi, 0, sizeof(*hwhi));
+	if (hwhi)
 		hwhi->hwht = *hwht;
-	}
 
 	return hwhi;
 }
--- linux-2.6.16-rc5-mm1/drivers/md/dm-emc.c.orig	2006-03-04 19:26:38.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/md/dm-emc.c	2006-03-04 19:27:01.000000000 +0100
@@ -221,12 +221,10 @@ fail_path:
 
 static struct emc_handler *alloc_emc_handler(void)
 {
-	struct emc_handler *h = kmalloc(sizeof(*h), GFP_KERNEL);
+	struct emc_handler *h = kzalloc(sizeof(*h), GFP_KERNEL);
 
-	if (h) {
-		memset(h, 0, sizeof(*h));
+	if (h) 
 		spin_lock_init(&h->lock);
-	}
 
 	return h;
 }
--- linux-2.6.16-rc5-mm1/drivers/md/dm-target.c.orig	2006-03-04 19:27:09.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/md/dm-target.c	2006-03-04 19:27:22.000000000 +0100
@@ -87,12 +87,10 @@ void dm_put_target_type(struct target_ty
 
 static struct tt_internal *alloc_target(struct target_type *t)
 {
-	struct tt_internal *ti = kmalloc(sizeof(*ti), GFP_KERNEL);
+	struct tt_internal *ti = kzalloc(sizeof(*ti), GFP_KERNEL);
 
-	if (ti) {
-		memset(ti, 0, sizeof(*ti));
+	if (ti)
 		ti->tt = *t;
-	}
 
 	return ti;
 }
--- linux-2.6.16-rc5-mm1/drivers/md/dm-mpath.c.orig	2006-03-04 19:27:28.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/md/dm-mpath.c	2006-03-04 19:28:36.000000000 +0100
@@ -113,12 +113,10 @@ static void trigger_event(void *data);
 
 static struct pgpath *alloc_pgpath(void)
 {
-	struct pgpath *pgpath = kmalloc(sizeof(*pgpath), GFP_KERNEL);
+	struct pgpath *pgpath = kzalloc(sizeof(*pgpath), GFP_KERNEL);
 
-	if (pgpath) {
-		memset(pgpath, 0, sizeof(*pgpath));
+	if (pgpath)
 		pgpath->path.is_active = 1;
-	}
 
 	return pgpath;
 }
@@ -132,11 +130,10 @@ static struct priority_group *alloc_prio
 {
 	struct priority_group *pg;
 
-	pg = kmalloc(sizeof(*pg), GFP_KERNEL);
+	pg = kzalloc(sizeof(*pg), GFP_KERNEL);
 	if (!pg)
 		return NULL;
 
-	memset(pg, 0, sizeof(*pg));
 	INIT_LIST_HEAD(&pg->pgpaths);
 
 	return pg;
@@ -171,9 +168,8 @@ static struct multipath *alloc_multipath
 {
 	struct multipath *m;
 
-	m = kmalloc(sizeof(*m), GFP_KERNEL);
+	m = kzalloc(sizeof(*m), GFP_KERNEL);
 	if (m) {
-		memset(m, 0, sizeof(*m));
 		INIT_LIST_HEAD(&m->priority_groups);
 		spin_lock_init(&m->lock);
 		m->queue_io = 1;
--- linux-2.6.16-rc5-mm1/drivers/md/dm-table.c.orig	2006-03-04 19:28:01.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/md/dm-table.c	2006-03-04 19:28:15.000000000 +0100
@@ -209,12 +209,11 @@ static int alloc_targets(struct dm_table
 
 int dm_table_create(struct dm_table **result, int mode, unsigned num_targets)
 {
-	struct dm_table *t = kmalloc(sizeof(*t), GFP_KERNEL);
+	struct dm_table *t = kzalloc(sizeof(*t), GFP_KERNEL);
 
 	if (!t)
 		return -ENOMEM;
 
-	memset(t, 0, sizeof(*t));
 	INIT_LIST_HEAD(&t->devices);
 	atomic_set(&t->holders, 1);
 



--===============69239587962955051==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69239587962955051==--
