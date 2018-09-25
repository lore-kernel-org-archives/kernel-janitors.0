From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 25 Sep 2018 14:56:19 +0000
Subject: [PATCH -next] uio: make symbol 'uio_class_registered' static
Message-Id: <1537887920-46141-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/uio/uio.c:277:6: warning:
 symbol 'uio_class_registered' was not declared. Should it be static?

Fixes: ae61cf5b9913 ("uio: ensure class is registered before devices")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/uio/uio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index 0ffb324..d4cc07d 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -274,7 +274,7 @@ static ssize_t event_show(struct device *dev,
 	.dev_groups = uio_groups,
 };
 
-bool uio_class_registered;
+static bool uio_class_registered;
 
 /*
  * device functions
