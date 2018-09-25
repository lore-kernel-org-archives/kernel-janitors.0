From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 25 Sep 2018 14:35:37 +0000
Subject: [PATCH -next] crypto: ccp - Make function sev_get_firmware() static
Message-Id: <1537886137-22153-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/crypto/ccp/psp-dev.c:444:5: warning:
 symbol 'sev_get_firmware' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/crypto/ccp/psp-dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/ccp/psp-dev.c b/drivers/crypto/ccp/psp-dev.c
index 3b33863..d64a78c 100644
--- a/drivers/crypto/ccp/psp-dev.c
+++ b/drivers/crypto/ccp/psp-dev.c
@@ -441,7 +441,8 @@ static int sev_get_api_version(void)
 	return 0;
 }
 
-int sev_get_firmware(struct device *dev, const struct firmware **firmware)
+static int sev_get_firmware(struct device *dev,
+			    const struct firmware **firmware)
 {
 	char fw_name_specific[SEV_FW_NAME_SIZE];
 	char fw_name_subset[SEV_FW_NAME_SIZE];
