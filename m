From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Mon, 30 Jun 2008 18:58:46 +0000
Subject: [PATCH] ext4 : Remove unused variable journal from ext4_show_options
Message-Id: <ea11fea30806301155u3daccf0eo2daf690396b5616f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ext4@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

===================================
Signed-off-by : Manish Katiyar <mkatiyar@gmail.com>

---
 fs/ext4/super.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index cb96f12..d9d12c1 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -671,7 +671,6 @@ static int ext4_show_options(struct seq_file *seq,
struct vfsmount *vfs)
        unsigned long def_mount_opts;
        struct super_block *sb = vfs->mnt_sb;
        struct ext4_sb_info *sbi = EXT4_SB(sb);
-       journal_t *journal = sbi->s_journal;
        struct ext4_super_block *es = sbi->s_es;

        def_mount_opts = le32_to_cpu(es->s_default_mount_opts);
-- 
1.5.4.3

====================================

-- 
Thanks & Regards,
********************************************
Manish Katiyar ( http://mkatiyar.googlepages.com )
3rd Floor, Fair Winds Block
EGL Software Park
Off Intermediate Ring Road
Bangalore 560071, India
***********************************************
