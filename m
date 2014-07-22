From: Artemiy Volkov <artemiyv@acm.org>
Date: Tue, 22 Jul 2014 17:58:32 +0000
Subject: [PATCH 0/5] ext2: Merge string literals on adjacent lines
Message-Id: <1406051917-3823-1-git-send-email-artemiyv@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Join lines and merge strings in ext2 files for ease of grep-ability, one file per patch.

Artemiy Volkov (5):
  ext2: super.c: Merge string literals on adjacent lines
  ext2: balloc.c: Merge string literals on adjacent lines
  ext2: dir.c: Merge string literals on adjacent lines
  ext2: inode.c: Merge string literals on adjacent lines
  ext2: xip.c: Merge string literals on adjacent lines

 fs/ext2/balloc.c | 32 +++++++++++-------------------
 fs/ext2/dir.c    | 11 +++++------
 fs/ext2/ialloc.c |  6 ++----
 fs/ext2/super.c  | 60 +++++++++++++++++++++++---------------------------------
 fs/ext2/xip.c    |  3 +--
 5 files changed, 43 insertions(+), 69 deletions(-)

-- 
1.9.1

