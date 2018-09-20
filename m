From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 20 Sep 2018 06:22:05 +0000
Subject: [PATCH -next] platform: goldfish: pipe: Make symbol 'goldfish_pipe_dev' static
Message-Id: <1537424525-23695-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Roman Kiryanov <rkir@google.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/platform/goldfish/goldfish_pipe.c:214:26: warning:
 symbol 'goldfish_pipe_dev' was not declared. Should it be static?


Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/platform/goldfish/goldfish_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/goldfish/goldfish_pipe.c
index b4a484b..0f66d77 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -211,7 +211,7 @@ struct goldfish_pipe_dev {
 	unsigned char __iomem *base;
 };
 
-struct goldfish_pipe_dev goldfish_pipe_dev;
+static struct goldfish_pipe_dev goldfish_pipe_dev;
 
 static int goldfish_pipe_cmd_locked(struct goldfish_pipe *pipe,
 				    enum PipeCmdCode cmd)
