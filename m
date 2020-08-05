From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Aug 2020 09:51:05 +0000
Subject: [PATCH] habanalabs: Fix a loop in gaudi_extract_ecc_info()
Message-Id: <20200805095105.GA483832@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Omer Shpigelman <oshpigelman@habana.ai>, Ofir Bitton <obitton@habana.ai>, Tomer Tayar <ttayar@habana.ai>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The condition was reversed.  It should have been less than instead of
greater than.  The result is that we never enter the loop.

Fixes: fcc6a4e60678 ("habanalabs: Extract ECC information from FW")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/habanalabs/gaudi/gaudi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/habanalabs/gaudi/gaudi.c b/drivers/misc/habanalabs/gaudi/gaudi.c
index 00a0a7238d81..de2f81b80ced 100644
--- a/drivers/misc/habanalabs/gaudi/gaudi.c
+++ b/drivers/misc/habanalabs/gaudi/gaudi.c
@@ -5215,7 +5215,7 @@ static int gaudi_extract_ecc_info(struct hl_device *hdev,
 	*memory_wrapper_idx = 0xFF;
 
 	/* Iterate through memory wrappers, a single bit must be set */
-	for (i = 0 ; i > num_mem_regs ; i++) {
+	for (i = 0 ; i < num_mem_regs ; i++) {
 		err_addr += i * 4;
 		err_word = RREG32(err_addr);
 		if (err_word) {
-- 
2.27.0
