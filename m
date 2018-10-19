From: Colin King <colin.king@canonical.com>
Date: Fri, 19 Oct 2018 12:58:01 +0000
Subject: [PATCH] test_firmware: fix error return getting clobbered
Message-Id: <20181019125801.4544-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where eq->fw->size > PAGE_SIZE the error return rc
is being set to EINVAL however this is being overwritten to
rc = req->fw->size because the error exit path via label 'out' is
not being taken.  Fix this by adding the jump to the error exit
path 'out'.

Detected by CoverityScan, CID#1453465 ("Unused value")

Fixes: c92316bf8e94 ("test_firmware: add batched firmware tests")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/test_firmware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index b984806d7d7b..7cab9a9869ac 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -837,6 +837,7 @@ static ssize_t read_firmware_show(struct device *dev,
 	if (req->fw->size > PAGE_SIZE) {
 		pr_err("Testing interface must use PAGE_SIZE firmware for now\n");
 		rc = -EINVAL;
+		goto out;
 	}
 	memcpy(buf, req->fw->data, req->fw->size);
 
-- 
2.19.1
