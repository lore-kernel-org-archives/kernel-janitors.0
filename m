From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 21 Feb 2009 19:50:37 +0000
Subject: [PATCH] init/main.c: fix sparse warnings: context imbalance
Message-Id: <20090221194940.12602.54077.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Attribute function 'init_post' with __releases(...).

Fix this sparse warnings:
  init/main.c:805:21: warning: context imbalance in 'init_post' - unexpected unlock
  init/main.c:899:9: warning: context imbalance in 'kernel_init' - wrong count at exit

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 init/main.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/init/main.c b/init/main.c
index 82456a9..fe53aa6 100644
--- a/init/main.c
+++ b/init/main.c
@@ -803,6 +803,7 @@ int initmem_now_dynamic;
  * makes it inline to init() and it becomes part of init.text section
  */
 static noinline int init_post(void)
+	__releases(kernel_lock)
 {
 	/* need to finish all async __init code before freeing the memory */
 	async_synchronize_full();

