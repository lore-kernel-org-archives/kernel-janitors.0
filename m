From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 11 Dec 2009 21:35:39 +0000
Subject: [PATCH 07/10] Fix misspellings of "truly" in comments.
Message-Id: <1260567342-8327-8-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some comments misspell "truly"; this fixes them. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 drivers/char/random.c                 |    2 +-
 drivers/gpu/drm/radeon/radeon_state.c |    2 +-
 drivers/net/cs89x0.c                  |    2 +-
 fs/dlm/member.c                       |    2 +-
 fs/namei.c                            |    2 +-
 include/math-emu/op-common.h          |    2 +-
 kernel/trace/ring_buffer.c            |    4 ++--
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 04b505e..a164e73 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1200,7 +1200,7 @@ const struct file_operations urandom_fops = {
 void generate_random_uuid(unsigned char uuid_out[16])
 {
 	get_random_bytes(uuid_out, 16);
-	/* Set UUID version to 4 --- truely random generation */
+	/* Set UUID version to 4 --- truly random generation */
 	uuid_out[6] = (uuid_out[6] & 0x0F) | 0x40;
 	/* Set the UUID variant to DCE */
 	uuid_out[8] = (uuid_out[8] & 0x3F) | 0x80;
diff --git a/drivers/gpu/drm/radeon/radeon_state.c b/drivers/gpu/drm/radeon/radeon_state.c
index 38537d9..71edb80 100644
--- a/drivers/gpu/drm/radeon/radeon_state.c
+++ b/drivers/gpu/drm/radeon/radeon_state.c
@@ -1065,7 +1065,7 @@ static void radeon_cp_dispatch_clear(struct drm_device * dev,
 					/* judging by the first tile offset needed, could possibly
 					   directly address/clear 4x4 tiles instead of 8x2 * 4x4
 					   macro tiles, though would still need clear mask for
-					   right/bottom if truely 4x4 granularity is desired ? */
+					   right/bottom if truly 4x4 granularity is desired ? */
 					OUT_RING(tileoffset * 16);
 					/* the number of tiles to clear */
 					OUT_RING(nrtilesx + 1);
diff --git a/drivers/net/cs89x0.c b/drivers/net/cs89x0.c
index 0c54219..329858c 100644
--- a/drivers/net/cs89x0.c
+++ b/drivers/net/cs89x0.c
@@ -580,7 +580,7 @@ cs89x0_probe1(struct net_device *dev, int ioaddr, int modular)
 	}
 
 #ifdef CONFIG_SH_HICOSH4
-	/* truely reset the chip */
+	/* truly reset the chip */
 	writeword(ioaddr, ADD_PORT, 0x0114);
 	writeword(ioaddr, DATA_PORT, 0x0040);
 #endif
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index b128775..80cdbbc 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -312,7 +312,7 @@ int dlm_ls_stop(struct dlm_ls *ls)
 	/*
 	 * This in_recovery lock does two things:
 	 * 1) Keeps this function from returning until all threads are out
-	 *    of locking routines and locking is truely stopped.
+	 *    of locking routines and locking is truly stopped.
 	 * 2) Keeps any new requests from being processed until it's unlocked
 	 *    when recovery is complete.
 	 */
diff --git a/fs/namei.c b/fs/namei.c
index d11f404..f4e9839 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2569,7 +2569,7 @@ SYSCALL_DEFINE2(link, const char __user *, oldname, const char __user *, newname
  *	e) conversion from fhandle to dentry may come in the wrong moment - when
  *	   we are removing the target. Solution: we will have to grab ->i_mutex
  *	   in the fhandle_to_dentry code. [FIXME - current nfsfh.c relies on
- *	   ->i_mutex on parents, which works but leads to some truely excessive
+ *	   ->i_mutex on parents, which works but leads to some truly excessive
  *	   locking].
  */
 static int vfs_rename_dir(struct inode *old_dir, struct dentry *old_dentry,
diff --git a/include/math-emu/op-common.h b/include/math-emu/op-common.h
index f456534..fd88226 100644
--- a/include/math-emu/op-common.h
+++ b/include/math-emu/op-common.h
@@ -29,7 +29,7 @@
   _FP_FRAC_DECL_##wc(X)
 
 /*
- * Finish truely unpacking a native fp value by classifying the kind
+ * Finish truly unpacking a native fp value by classifying the kind
  * of fp value and normalizing both the exponent and the fraction.
  */
 
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index a1ca495..74d1a98 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2546,7 +2546,7 @@ EXPORT_SYMBOL_GPL(ring_buffer_record_disable);
  * @buffer: The ring buffer to enable writes
  *
  * Note, multiple disables will need the same number of enables
- * to truely enable the writing (much like preempt_disable).
+ * to truly enable the writing (much like preempt_disable).
  */
 void ring_buffer_record_enable(struct ring_buffer *buffer)
 {
@@ -2582,7 +2582,7 @@ EXPORT_SYMBOL_GPL(ring_buffer_record_disable_cpu);
  * @cpu: The CPU to enable.
  *
  * Note, multiple disables will need the same number of enables
- * to truely enable the writing (much like preempt_disable).
+ * to truly enable the writing (much like preempt_disable).
  */
 void ring_buffer_record_enable_cpu(struct ring_buffer *buffer, int cpu)
 {
-- 
1.6.3.3

