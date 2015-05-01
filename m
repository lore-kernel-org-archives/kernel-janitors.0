From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:38:02 +0000
Subject: [PATCH 5/20] Staging: lustre: llite: dir: remove unneeded null test before free
Message-Id: <1430509086-22132-17-git-send-email-Julia.Lawall@lip6.fr>
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

This patch additionally simplifies one case where the free, and thus the
jump to the end of the function, is not needed.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/llite/dir.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/dir.c b/drivers/staging/lustre/lustre/llite/dir.c
index f17154a..4b0de8d 100644
--- a/drivers/staging/lustre/lustre/llite/dir.c
+++ b/drivers/staging/lustre/lustre/llite/dir.c
@@ -754,10 +754,8 @@ int ll_dir_setstripe(struct inode *inode, struct lov_user_md *lump,
 		char *buf;
 
 		param = kzalloc(MGS_PARAM_MAXLEN, GFP_NOFS);
-		if (!param) {
-			rc = -ENOMEM;
-			goto end;
-		}
+		if (!param)
+			return -ENOMEM;
 
 		buf = param;
 		/* Get fsname and assume devname to be -MDT0000. */
@@ -786,8 +784,7 @@ int ll_dir_setstripe(struct inode *inode, struct lov_user_md *lump,
 		rc = ll_send_mgc_param(mgc->u.cli.cl_mgc_mgsexp, param);
 
 end:
-		if (param != NULL)
-			kfree(param);
+		kfree(param);
 	}
 	return rc;
 }

