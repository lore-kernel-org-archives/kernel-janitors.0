From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 11:21:41 +0000
Subject: [PATCH 09/56] efs: Remove void casts
Message-Id: <1239189748-11703-10-git-send-email-jwjstone@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-8-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-9-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-9-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---
 fs/efs/super.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/efs/super.c b/fs/efs/super.c
index f049428..6869342 100644
--- a/fs/efs/super.c
+++ b/fs/efs/super.c
@@ -59,7 +59,7 @@ static struct kmem_cache * efs_inode_cachep;
 static struct inode *efs_alloc_inode(struct super_block *sb)
 {
 	struct efs_inode_info *ei;
-	ei = (struct efs_inode_info *)kmem_cache_alloc(efs_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(efs_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	return &ei->vfs_inode;
-- 
1.5.4.3

