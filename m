From: "Hannes Eder" <hannes@hanneseder.net>
Date: Mon, 24 Nov 2008 19:31:29 +0000
Subject: [PATCH] proc: fix sparse warning
Message-Id: <154e089b0811241131m3a15fb14qaea2d151e14ef4ac@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Impact: fix sparse warning

fs/proc/base.c:312:4: warning: do-while statement is not a compound statement

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 fs/proc/base.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 94ec750..0801249 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -308,9 +308,9 @@ static int proc_pid_auxv(struct task_struct *task,
char *buffer)
 	struct mm_struct *mm = get_task_mm(task);
 	if (mm) {
 		unsigned int nwords = 0;
-		do
+		do {
 			nwords += 2;
-		while (mm->saved_auxv[nwords - 2] != 0); /* AT_NULL */
+		} while (mm->saved_auxv[nwords - 2] != 0); /* AT_NULL */
 		res = nwords * sizeof(mm->saved_auxv[0]);
 		if (res > PAGE_SIZE)
 			res = PAGE_SIZE;
