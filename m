From: Colin King <colin.king@canonical.com>
Date: Thu, 27 Apr 2017 17:41:34 +0000
Subject: [PATCH] goldfish_pipe: make pipe_dev static
Message-Id: <20170427174134.14892-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jan Kara <jack@suse.cz>, Jin Qian <jinqian@android.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Make this static as it's only referenced in this source and
it does not need global scope.

Cleans up a sparse warning:

drivers/platform/goldfish/goldfish_pipe.c: warning: symbol 
  'pipe_dev' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/goldfish/goldfish_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/goldfish/goldfish_pipe.c
index 2de1e603bd2b..8a4b088c52a7 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -266,7 +266,7 @@ struct goldfish_pipe_dev {
 	unsigned char __iomem *base;
 };
 
-struct goldfish_pipe_dev pipe_dev[1] = {};
+static struct goldfish_pipe_dev pipe_dev[1] = {};
 
 static int goldfish_cmd_locked(struct goldfish_pipe *pipe, enum PipeCmdCode cmd)
 {
-- 
2.11.0

