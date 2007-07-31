From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 18:05:44 +0000
Subject: [PATCH 34] fs/autofs4/inode.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312005.44495.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, raven@themaw.net, autofs@linux.kernel.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 fs/autofs4/inode.c | 10467 -> 10435 (-32 bytes)
 fs/autofs4/inode.o | 98576 -> 98552 (-24 bytes)

 fs/autofs4/inode.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/fs/autofs4/inode.c	2007-07-26 13:07:46.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/fs/autofs4/inode.c	2007-07-29 23:56:08.000000000 +0200
@@ -312,13 +312,11 @@ int autofs4_fill_super(struct super_bloc
 	struct autofs_sb_info *sbi;
 	struct autofs_info *ino;

-	sbi = kmalloc(sizeof(*sbi), GFP_KERNEL);
+	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if (!sbi)
 		goto fail_unlock;
 	DPRINTK("starting up, sbi = %p",sbi);

-	memset(sbi, 0, sizeof(*sbi));
-
 	s->s_fs_info = sbi;
 	sbi->magic = AUTOFS_SBI_MAGIC;
 	sbi->pipefd = -1;
