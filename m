From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 14 Mar 2020 13:32:44 +0000
Subject: [PATCH] fs/seq_file: Fix a string literal in seq_read()
Message-Id: <325648be-032b-8b50-f4eb-a2cebce7a475@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Vasily Averin <vvs@virtuozzo.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>, Manfred Spraul <manfred@colorfullife.com>, Neil Brown <neilb@suse.com>, Peter Oberparleiter <oberpar@linux.ibm.com>, Qian Cai <cai@lca.pw>, Steven Rostedt <rostedt@goodmis.org>, Waiman Long <longman@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Mar 2020 14:14:19 +0100

* Improve a message a bit.

* The script “checkpatch.pl” pointed information out like the following.

  WARNING: quoted string split across lines

  Thus fix the affected source code place.

Fixes: defeadd3551c5565fbc76c97d6e99378b8acb1bf ("seq_read-info-message-about-buggy-next-functions-fix")
Fixes: c828e17c5312095fc25bbe78b16e97e99af72b9a ("fs/seq_file.c: seq_read(): add info message about buggy .next functions")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/seq_file.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/seq_file.c b/fs/seq_file.c
index d2a3dc5b9f3d..85cee24d36e8 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -257,9 +257,8 @@ ssize_t seq_read(struct file *file, char __user *buf, size_t size, loff_t *ppos)

 		p = m->op->next(m, p, &m->index);
 		if (pos == m->index) {
-			pr_info_ratelimited("buggy seq_file .next function %ps "
-				"did not updated position index\n",
-				m->op->next);
+			pr_info_ratelimited("buggy seq_file .next function %ps did not update position index\n",
+					    m->op->next);
 			m->index++;
 		}
 		if (!p || IS_ERR(p)) {
--
2.25.1
