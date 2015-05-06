From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 06 May 2015 14:59:42 +0000
Subject: [PATCH] Staging: lustre: llite: Drop unneeded variables
Message-Id: <1430924383-30791-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Drop variables made unnecessary by conversion of obd free functions
to kfree.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/llite/file.c      |    2 --
 drivers/staging/lustre/lustre/llite/llite_lib.c |    1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/file.c b/drivers/staging/lustre/lustre/llite/file.c
index 702f62d..5c05f41 100644
--- a/drivers/staging/lustre/lustre/llite/file.c
+++ b/drivers/staging/lustre/lustre/llite/file.c
@@ -3239,8 +3239,6 @@ void ll_iocontrol_unregister(void *magic)
 	down_write(&llioc.ioc_sem);
 	list_for_each_entry(tmp, &llioc.ioc_head, iocd_list) {
 		if (tmp = magic) {
-			unsigned int size = tmp->iocd_size;
-
 			list_del(&tmp->iocd_list);
 			up_write(&llioc.ioc_sem);
 
diff --git a/drivers/staging/lustre/lustre/llite/llite_lib.c b/drivers/staging/lustre/lustre/llite/llite_lib.c
index c6611b1..dd62e33 100644
--- a/drivers/staging/lustre/lustre/llite/llite_lib.c
+++ b/drivers/staging/lustre/lustre/llite/llite_lib.c
@@ -905,7 +905,6 @@ int ll_fill_super(struct super_block *sb, struct vfsmount *mnt)
 	char  *profilenm = get_profile_name(sb);
 	struct config_llog_instance *cfg;
 	/* %p for void* in printf needs 16+2 characters: 0xffffffffffffffff */
-	const int instlen = sizeof(cfg->cfg_instance) * 2 + 2;
 	int    err;
 
 	CDEBUG(D_VFSTRACE, "VFS Op: sb %p\n", sb);

