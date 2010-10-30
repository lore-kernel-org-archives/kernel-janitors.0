From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 30 Oct 2010 09:04:37 +0000
Subject: [PATCH] ipc: shm: fix information leak to userland
Message-Id: <1288429477-21920-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>, David Howells <dhowells@redhat.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org

Structure shmid_ds is copied to userland with shm_unused{,2,3}
fields unitialized.  It leads to leaking of contents of kernel stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 ipc/shm.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/ipc/shm.c b/ipc/shm.c
index fd658a1..7d3bb22 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -479,6 +479,7 @@ static inline unsigned long copy_shmid_to_user(void __user *buf, struct shmid64_
 	    {
 		struct shmid_ds out;
 
+		memset(&out, 0, sizeof(out));
 		ipc64_perm_to_ipc_perm(&in->shm_perm, &out.shm_perm);
 		out.shm_segsz	= in->shm_segsz;
 		out.shm_atime	= in->shm_atime;
-- 
1.7.0.4

