From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:38:01 +0000
Subject: [PATCH 6/20] Staging: lustre: llite: file: remove unneeded null test before free
Message-Id: <1430509086-22132-16-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Kfree can cope with a null argument, so drop null tests.

The semantic patch that finds this issue is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr; @@

- if (ptr != NULL)
  kfree(ptr);
// </smpl>

In the first case, llss can never be null at the point of the kfree anyway.

In the second set of changes, the gotos are either eliminated, when no
freeing is needed (hss failure case), or rewritten so that there is no call
to free on data that has not yet been allocated (free_hss goto case).
There is no goto at which attr is not null, so the out label is simply
dropped.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/llite/file.c |   23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/file.c b/drivers/staging/lustre/lustre/llite/file.c
index 6e50b35..702f62d 100644
--- a/drivers/staging/lustre/lustre/llite/file.c
+++ b/drivers/staging/lustre/lustre/llite/file.c
@@ -2109,8 +2109,7 @@ putgl:
 	}
 
 free:
-	if (llss != NULL)
-		kfree(llss);
+	kfree(llss);
 
 	return rc;
 }
@@ -2152,22 +2151,20 @@ static int ll_hsm_import(struct inode *inode, struct file *file,
 
 	/* set HSM flags */
 	hss = kzalloc(sizeof(*hss), GFP_NOFS);
-	if (!hss) {
-		rc = -ENOMEM;
-		goto out;
-	}
+	if (!hss)
+		return -ENOMEM;
 
 	hss->hss_valid = HSS_SETMASK | HSS_ARCHIVE_ID;
 	hss->hss_archive_id = hui->hui_archive_id;
 	hss->hss_setmask = HS_ARCHIVED | HS_EXISTS | HS_RELEASED;
 	rc = ll_hsm_state_set(inode, hss);
 	if (rc != 0)
-		goto out;
+		goto free_hss;
 
 	attr = kzalloc(sizeof(*attr), GFP_NOFS);
 	if (!attr) {
 		rc = -ENOMEM;
-		goto out;
+		goto free_hss;
 	}
 
 	attr->ia_mode = hui->hui_mode & (S_IRWXU | S_IRWXG | S_IRWXO);
@@ -2193,13 +2190,9 @@ static int ll_hsm_import(struct inode *inode, struct file *file,
 
 	mutex_unlock(&inode->i_mutex);
 
-out:
-	if (hss != NULL)
-		kfree(hss);
-
-	if (attr != NULL)
-		kfree(attr);
-
+	kfree(attr);
+free_hss:
+	kfree(hss);
 	return rc;
 }
 

