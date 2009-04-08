From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 11:21:33 +0000
Subject: [PATCH 01/56] adfs: Remove void casts
Message-Id: <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---
 fs/adfs/super.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/adfs/super.c b/fs/adfs/super.c
index dd9becc..9ae1ed1 100644
--- a/fs/adfs/super.c
+++ b/fs/adfs/super.c
@@ -242,7 +242,7 @@ static struct kmem_cache *adfs_inode_cachep;
 static struct inode *adfs_alloc_inode(struct super_block *sb)
 {
 	struct adfs_inode_info *ei;
-	ei = (struct adfs_inode_info *)kmem_cache_alloc(adfs_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(adfs_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	return &ei->vfs_inode;
-- 
1.5.4.3

