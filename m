From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 19:07:50 +0000
Subject: [PATCH 2/5] staging: lustre: llite: drop trivially useless initialization
Message-Id: <1434827273-13929-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434827273-13929-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434827273-13929-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove initialization of a variable that is immediately reassigned.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
identifier x;
constant C;
expression e;
@@

T x
- = C
 ;
x = e;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/llite/file.c        |    2 +-
 drivers/staging/lustre/lustre/llite/xattr_cache.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/llite/xattr_cache.c b/drivers/staging/lustre/lustre/llite/xattr_cache.c
--- a/drivers/staging/lustre/lustre/llite/xattr_cache.c
+++ b/drivers/staging/lustre/lustre/llite/xattr_cache.c
@@ -357,7 +357,7 @@ static int ll_xattr_cache_refill(struct
 	struct ll_inode_info *lli = ll_i2info(inode);
 	struct mdt_body *body;
 	__u32 *xsizes;
-	int rc = 0, i;
+	int rc, i;
 
 
 
diff -u -p a/drivers/staging/lustre/lustre/llite/file.c b/drivers/staging/lustre/lustre/llite/file.c
--- a/drivers/staging/lustre/lustre/llite/file.c
+++ b/drivers/staging/lustre/lustre/llite/file.c
@@ -3005,7 +3005,7 @@ int ll_getattr(struct vfsmount *mnt, str
 	struct inode *inode = d_inode(de);
 	struct ll_sb_info *sbi = ll_i2sbi(inode);
 	struct ll_inode_info *lli = ll_i2info(inode);
-	int res = 0;
+	int res;
 
 	res = ll_inode_revalidate(de, MDS_INODELOCK_UPDATE |
 				      MDS_INODELOCK_LOOKUP);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
