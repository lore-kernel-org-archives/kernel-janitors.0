From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:38:00 +0000
Subject: [PATCH 7/20] Staging: lustre: llite: llite_lib: remove unneeded null test before free
Message-Id: <1430509086-22132-15-git-send-email-Julia.Lawall@lip6.fr>
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
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/llite/llite_lib.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/llite_lib.c b/drivers/staging/lustre/lustre/llite/llite_lib.c
index e5bac94..c6611b1 100644
--- a/drivers/staging/lustre/lustre/llite/llite_lib.c
+++ b/drivers/staging/lustre/lustre/llite/llite_lib.c
@@ -574,10 +574,8 @@ static int client_common_fill_super(struct super_block *sb, char *md, char *dt,
 		get_uuid2fsid(uuid->uuid, strlen(uuid->uuid), &sbi->ll_fsid);
 	}
 
-	if (data != NULL)
-		kfree(data);
-	if (osfs != NULL)
-		kfree(osfs);
+	kfree(data);
+	kfree(osfs);
 
 	return err;
 out_root:
@@ -595,10 +593,8 @@ out_md:
 	obd_disconnect(sbi->ll_md_exp);
 	sbi->ll_md_exp = NULL;
 out:
-	if (data != NULL)
-		kfree(data);
-	if (osfs != NULL)
-		kfree(osfs);
+	kfree(data);
+	kfree(osfs);
 	lprocfs_unregister_mountpoint(sbi);
 	return err;
 }

