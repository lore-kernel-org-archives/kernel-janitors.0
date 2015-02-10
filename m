From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Tue, 10 Feb 2015 14:12:07 +0000
Subject: [PATCH v2 1/1] staging: unisys: Remove allocation from declaration line
Message-Id: <20150210141207.GA19764@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Romer <benjamin.romer@unisys.com>, David Kershner <david.kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com
Cc: kernel-janitors@vger.kernel.org, sparmaintainer@unisys.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This patch removes allocation from declaration line because
people are known to gloss over declarations.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 The second of version of this patch fix the checkpatch warning of
 line over 80 char by rewriting the size argument of kmalloc as suggested by 
 Sudip.

 drivers/staging/unisys/visorchipset/visorchipset_main.c | 6 +++---
 drivers/staging/unisys/visorutil/charqueue.c            | 3 ++-
 drivers/staging/unisys/visorutil/memregion_direct.c     | 5 +++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/unisys/visorchipset/visorchipset_main.c b/drivers/staging/unisys/visorchipset/visorchipset_main.c
index 82e259d..9251714 100644
--- a/drivers/staging/unisys/visorchipset/visorchipset_main.c
+++ b/drivers/staging/unisys/visorchipset/visorchipset_main.c
@@ -1604,9 +1604,9 @@ parahotplug_next_expiration(void)
 static struct parahotplug_request *
 parahotplug_request_create(struct controlvm_message *msg)
 {
-	struct parahotplug_request *req -	    kmalloc(sizeof(struct parahotplug_request),
-		    GFP_KERNEL|__GFP_NORETRY);
+	struct parahotplug_request *req;
+
+	req = kmalloc(sizeof(*req), GFP_KERNEL|__GFP_NORETRY);
 	if (req = NULL)
 		return NULL;
 
diff --git a/drivers/staging/unisys/visorutil/charqueue.c b/drivers/staging/unisys/visorutil/charqueue.c
index ac7acb7..e2ee5ee 100644
--- a/drivers/staging/unisys/visorutil/charqueue.c
+++ b/drivers/staging/unisys/visorutil/charqueue.c
@@ -36,8 +36,9 @@ struct charqueue {
 struct charqueue *visor_charqueue_create(ulong nslots)
 {
 	int alloc_size = sizeof(struct charqueue) + nslots + 1;
-	struct charqueue *cq = kmalloc(alloc_size, GFP_KERNEL|__GFP_NORETRY);
+	struct charqueue *cq;
 
+	cq = kmalloc(alloc_size, GFP_KERNEL|__GFP_NORETRY);
 	if (cq = NULL) {
 		ERRDRV("visor_charqueue_create allocation failed (alloc_size=%d)",
 		       alloc_size);
diff --git a/drivers/staging/unisys/visorutil/memregion_direct.c b/drivers/staging/unisys/visorutil/memregion_direct.c
index 33522cc..f4ecac0 100644
--- a/drivers/staging/unisys/visorutil/memregion_direct.c
+++ b/drivers/staging/unisys/visorutil/memregion_direct.c
@@ -41,8 +41,9 @@ struct memregion *
 visor_memregion_create(HOSTADDRESS physaddr, ulong nbytes)
 {
 	struct memregion *rc = NULL;
-	struct memregion *memregion = kzalloc(sizeof(*memregion),
-					      GFP_KERNEL | __GFP_NORETRY);
+	struct memregion *memregion;
+
+	memregion = kzalloc(sizeof(*memregion), GFP_KERNEL | __GFP_NORETRY);
 	if (memregion = NULL) {
 		ERRDRV("visor_memregion_create allocation failed");
 		return NULL;
-- 
1.9.1

