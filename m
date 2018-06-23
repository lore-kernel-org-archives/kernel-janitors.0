From: Colin King <colin.king@canonical.com>
Date: Sat, 23 Jun 2018 22:26:54 +0000
Subject: [PATCH] goldfish_pipe: make tasklet goldfish_interrupt_tasklet static
Message-Id: <20180623222654.6697-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Tasklet goldfish_interrupt_tasklet is local to the source and
does not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'goldfish_interrupt_tasklet' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/goldfish/goldfish_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/goldfish/goldfish_pipe.c
index 3e32a4c14d5f..4866a8b12e98 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -645,7 +645,7 @@ static void goldfish_interrupt_task(unsigned long unused)
 		wake_up_interruptible(&pipe->wake_queue);
 	}
 }
-DECLARE_TASKLET(goldfish_interrupt_tasklet, goldfish_interrupt_task, 0);
+static DECLARE_TASKLET(goldfish_interrupt_tasklet, goldfish_interrupt_task, 0);
 
 /*
  * The general idea of the interrupt handling:
-- 
2.17.0

