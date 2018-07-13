From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 13 Jul 2018 00:50:07 +0000
Subject: [PATCH -next] fsi: sbefifo: Fix missing unlock on error in sbefifo_dump_ffdc()
Message-Id: <1531443007-144851-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.vnet.ibm.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function sbefifo_dump_ffdc()
in the error handling case.

Fixes: 9f4a8a2d7f9d ("fsi/sbefifo: Add driver for the SBE FIFO")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/fsi/fsi-sbefifo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 6b31cc24..35f2749 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -150,6 +150,7 @@ static void sbefifo_dump_ffdc(struct device *dev, const __be32 *ffdc,
 		u32 w0, w1, w2, i;
 		if (ffdc_sz < 3) {
 			dev_err(dev, "SBE invalid FFDC package size %zd\n", ffdc_sz);
+			mutex_unlock(&sbefifo_ffdc_mutex);
 			return;
 		}
 		w0 = be32_to_cpu(*(ffdc++));

