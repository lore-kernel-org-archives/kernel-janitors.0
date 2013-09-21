From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 21 Sep 2013 22:27:34 +0000
Subject: [PATCH 02/19] hv: Change variable type to bool
Message-Id: <1379802471-30252-2-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kys@microsoft.com
Cc: haiyangz@microsoft.com, devel@linuxdriverproject.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

The variable execute_shutdown is only assigned the values true and
false. Change its type to bool.

The simplified semantic patch that find this problem is as
follows (http://coccinelle.lip6.fr/):

@exists@
type T;
identifier b;
@@
- T
+ bool
  b = ...;
  ... when any
  b = \(true\|false\)

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/hv/hv_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/hv_util.c b/drivers/hv/hv_util.c
index cb82233..fa37369 100644
--- a/drivers/hv/hv_util.c
+++ b/drivers/hv/hv_util.c
@@ -82,7 +82,7 @@ static void shutdown_onchannelcallback(void *context)
 	struct vmbus_channel *channel = context;
 	u32 recvlen;
 	u64 requestid;
-	u8  execute_shutdown = false;
+	bool  execute_shutdown = false;
 	u8  *shut_txf_buf = util_shutdown.recv_buffer;
 
 	struct shutdown_msg_data *shutdown_msg;
-- 
1.8.3.1

