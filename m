From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 06 Nov 2020 06:22:10 +0000
Subject: [PATCH] taskstats: remove unneeded dead assignment
Message-Id: <20201106062210.27920-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>
Cc: Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

make clang-analyzer on x86_64 defconfig caught my attention with:

  kernel/taskstats.c:120:2: warning: Value stored to 'rc' is never read \
  [clang-analyzer-deadcode.DeadStores]
          rc = 0;
          ^

Commit d94a041519f3 ("taskstats: free skb, avoid returns in
send_cpu_listeners") made send_cpu_listeners() not return a value and
hence, the rc variable remained only to be used within the loop where
it is always assigned before read and it does not need any other
initialisation.

So, simply remove this unneeded dead initializing assignment.

As compilers will detect this unneeded assignment and optimize this anyway,
the resulting object code is identical before and after this change.

No functional change. No change to object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201105

Balbir, please pick this minor non-urgent clean-up patch.

 kernel/taskstats.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index a2802b6ff4bb..bd18a7bf5276 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -117,7 +117,6 @@ static void send_cpu_listeners(struct sk_buff *skb,
 
 	genlmsg_end(skb, reply);
 
-	rc = 0;
 	down_read(&listeners->sem);
 	list_for_each_entry(s, &listeners->list, list) {
 		skb_next = NULL;
-- 
2.17.1
