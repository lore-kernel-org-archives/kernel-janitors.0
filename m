From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 26 Jul 2010 08:27:09 +0000
Subject: [PATCH] afs: do not set task state after schedule_timeout()
Message-Id: <1280132829-8224-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>, Tejun Heo <tj@kernel.org>, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org

schedule_timeout() sets tast state to TASK_RUNNING, so there's no need
to set it explicitly.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 fs/afs/vlocation.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/afs/vlocation.c b/fs/afs/vlocation.c
index 9ac260d..21f270d 100644
--- a/fs/afs/vlocation.c
+++ b/fs/afs/vlocation.c
@@ -130,7 +130,6 @@ static int afs_vlocation_access_vl_by_id(struct afs_vlocation *vl,
 					/* second+ BUSY - sleep a little bit */
 					set_current_state(TASK_UNINTERRUPTIBLE);
 					schedule_timeout(1);
-					__set_current_state(TASK_RUNNING);
 				}
 				continue;
 			}
-- 
1.7.0.4

