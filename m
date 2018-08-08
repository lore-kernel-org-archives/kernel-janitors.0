From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 08 Aug 2018 04:30:09 +0000
Subject: [PATCH -next] crypto: hisilicon - Make function sec_send_request() static
Message-Id: <1533702609-162042-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/crypto/hisilicon/sec/sec_algs.c:396:5: warning:
 symbol 'sec_send_request' was not declared. Should it be static?

Fixes: 915e4e8413da ("crypto: hisilicon - SEC security accelerator driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/crypto/hisilicon/sec/sec_algs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/hisilicon/sec/sec_algs.c b/drivers/crypto/hisilicon/sec/sec_algs.c
index d69d3ce..03ba1df 100644
--- a/drivers/crypto/hisilicon/sec/sec_algs.c
+++ b/drivers/crypto/hisilicon/sec/sec_algs.c
@@ -393,7 +393,8 @@ static void sec_alg_free_el(struct sec_request_el *el,
 }
 
 /* queuelock must be held */
-int sec_send_request(struct sec_request *sec_req, struct sec_queue *queue)
+static int sec_send_request(struct sec_request *sec_req,
+			    struct sec_queue *queue)
 {
 	struct sec_request_el *el, *temp;
 	int ret = 0;

