From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 11:21:43 +0000
Subject: [PATCH 11/56] freevxfs: Remove void casts
Message-Id: <1239189748-11703-12-git-send-email-jwjstone@fastmail.fm>
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
 <1239189748-11703-10-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-11-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-11-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---
 fs/freevxfs/vxfs_inode.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/freevxfs/vxfs_inode.c b/fs/freevxfs/vxfs_inode.c
index 03a6ea5..9811217 100644
--- a/fs/freevxfs/vxfs_inode.c
+++ b/fs/freevxfs/vxfs_inode.c
@@ -138,7 +138,7 @@ __vxfs_iget(ino_t ino, struct inode *ilistp)
 	if (!IS_ERR(pp)) {
 		struct vxfs_inode_info	*vip;
 		struct vxfs_dinode	*dip;
-		caddr_t			kaddr = (char *)page_address(pp);
+		caddr_t			kaddr = page_address(pp);
 
 		if (!(vip = kmem_cache_alloc(vxfs_inode_cachep, GFP_KERNEL)))
 			goto fail;
-- 
1.5.4.3

