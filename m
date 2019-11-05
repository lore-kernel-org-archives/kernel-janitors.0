From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Nov 2019 17:51:08 +0000
Subject: [PATCH][next] staging: vboxsf: fix dereference of pointer dentry before it is null checked
Message-Id: <20191105175108.79824-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the pointer dentry is being dereferenced before it is
being null checked.  Fix this by only dereferencing dentry once
we know it is not null.

Addresses-Coverity: ("Dereference before null check")
Fixes: df4028658f9d ("staging: Add VirtualBox guest shared folder (vboxsf) support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/vboxsf/utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vboxsf/utils.c b/drivers/staging/vboxsf/utils.c
index 1870b69c824e..34a49e6f74fc 100644
--- a/drivers/staging/vboxsf/utils.c
+++ b/drivers/staging/vboxsf/utils.c
@@ -174,7 +174,7 @@ int vboxsf_stat_dentry(struct dentry *dentry, struct shfl_fsobjinfo *info)
 
 int vboxsf_inode_revalidate(struct dentry *dentry)
 {
-	struct vboxsf_sbi *sbi = VBOXSF_SBI(dentry->d_sb);
+	struct vboxsf_sbi *sbi;
 	struct vboxsf_inode *sf_i;
 	struct shfl_fsobjinfo info;
 	struct timespec64 prev_mtime;
@@ -187,6 +187,7 @@ int vboxsf_inode_revalidate(struct dentry *dentry)
 	inode = d_inode(dentry);
 	prev_mtime = inode->i_mtime;
 	sf_i = VBOXSF_I(inode);
+	sbi = VBOXSF_SBI(dentry->d_sb);
 	if (!sf_i->force_restat) {
 		if (time_before(jiffies, dentry->d_time + sbi->o.ttl))
 			return 0;
-- 
2.20.1
