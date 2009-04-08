From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 13:49:56 +0000
Subject: Re: [PATCH 04/56] befs: Remove void casts
Message-Id: <49DCAB84.4030802@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080426p71cf193ei5e3806e3781336d2@mail.gmail.com>
In-Reply-To: <36ca99e90904080426p71cf193ei5e3806e3781336d2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

Heres the fixed patch

Thanks

Jack

befs: Remove void casts

From: Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---

 fs/befs/linuxvfs.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/befs/linuxvfs.c b/fs/befs/linuxvfs.c
index 76afd0d..e8b56a1 100644
--- a/fs/befs/linuxvfs.c
+++ b/fs/befs/linuxvfs.c
@@ -277,8 +277,7 @@ static struct inode *
 befs_alloc_inode(struct super_block *sb)
 {
         struct befs_inode_info *bi;
-        bi = (struct befs_inode_info *)kmem_cache_alloc(befs_inode_cachep,
-                            GFP_KERNEL);
+        bi = kmem_cache_alloc(befs_inode_cachep, GFP_KERNEL);
         if (!bi)
                 return NULL;
         return &bi->vfs_inode;
