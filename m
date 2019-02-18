From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 18 Feb 2019 14:49:00 +0000
Subject: [PATCH] crypto: stm32 drop pointless static qualifier in stm32_hash_remove()
Message-Id: <20190218144900.142544-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, mcoquelin.stm32@gmail.com, clabbe.montjoie@gmail.com, gilad@benyossef.com, ebiggers@google.com, keescook@chromium.org, alexandre.torgue@st.com

There is no need to have the struct stm32_hash_dev *hdev static
since new value always be assigned before use it.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/crypto/stm32/stm32-hash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 590d7352837e..4a6cc8a3045d 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -1564,7 +1564,7 @@ static int stm32_hash_probe(struct platform_device *pdev)
 
 static int stm32_hash_remove(struct platform_device *pdev)
 {
-	static struct stm32_hash_dev *hdev;
+	struct stm32_hash_dev *hdev;
 	int ret;
 
 	hdev = platform_get_drvdata(pdev);
-- 
2.20.1
