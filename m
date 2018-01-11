From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 11 Jan 2018 11:12:55 +0000
Subject: [PATCH -next] test_firmware: fix missing unlock on error in config_num_requests_store()
Message-Id: <1515669175-125502-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function
config_num_requests_store() in the error handling case.

Fixes: c92316bf8e94 ("test_firmware: add batched firmware tests")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 lib/test_firmware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index 964784d..4647647 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -371,6 +371,7 @@ static ssize_t config_num_requests_store(struct device *dev,
 	if (test_fw_config->reqs) {
 		pr_err("Must call release_all_firmware prior to changing config\n");
 		rc = -EINVAL;
+		mutex_unlock(&test_fw_mutex);
 		goto out;
 	}
 	mutex_unlock(&test_fw_mutex);

