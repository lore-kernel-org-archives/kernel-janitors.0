From: Hannes Eder <hannes@hanneseder.net>
Date: Tue, 24 Feb 2009 12:32:51 +0000
Subject: [PATCH v2] init/main.c: annotate 'init_post' with
Message-Id: <20090224123210.10671.76731.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49A148F7.1010302@s5r6.in-berlin.de>
In-Reply-To: <49A148F7.1010302@s5r6.in-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This fixes the following sparse warnings:
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

