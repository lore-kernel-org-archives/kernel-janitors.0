From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Feb 2019 18:37:00 +0000
Subject: [PATCH 1/2] test_firmware: remove some dead code
Message-Id: <20190221183700.GA1737@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

The test_fw_config->reqs allocation succeeded so these addresses can't
be NULL.  Also on the second error path, we forgot to set
"rc = -ENOMEM;".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/test_firmware.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index 7cab9a9869ac..7222093ee00b 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -631,11 +631,6 @@ static ssize_t trigger_batched_requests_store(struct device *dev,
 
 	for (i = 0; i < test_fw_config->num_requests; i++) {
 		req = &test_fw_config->reqs[i];
-		if (!req) {
-			WARN_ON(1);
-			rc = -ENOMEM;
-			goto out_bail;
-		}
 		req->fw = NULL;
 		req->idx = i;
 		req->name = test_fw_config->name;
@@ -737,10 +732,6 @@ ssize_t trigger_batched_requests_async_store(struct device *dev,
 
 	for (i = 0; i < test_fw_config->num_requests; i++) {
 		req = &test_fw_config->reqs[i];
-		if (!req) {
-			WARN_ON(1);
-			goto out_bail;
-		}
 		req->name = test_fw_config->name;
 		req->fw = NULL;
 		req->idx = i;
-- 
2.17.1
