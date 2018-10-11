From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 11 Oct 2018 01:49:48 +0000
Subject: [PATCH -next] crypto: mxs-dcp: make symbols 'sha1_null_hash' and 'sha256_null_hash' static
Message-Id: <1539222588-21750-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

drivers/crypto/mxs-dcp.c:39:15: warning:
 symbol 'sha1_null_hash' was not declared. Should it be static?
drivers/crypto/mxs-dcp.c:43:15: warning:
 symbol 'sha256_null_hash' was not declared. Should it be static?

Fixes: c709eebaf5c5 ("crypto: mxs-dcp - Fix SHA null hashes and output length")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/crypto/mxs-dcp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index 849a81e..4e6ff32 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -36,11 +36,11 @@
  * Null hashes to align with hw behavior on imx6sl and ull
  * these are flipped for consistency with hw output
  */
-const uint8_t sha1_null_hash[] +static const uint8_t sha1_null_hash[]  	"\x09\x07\xd8\xaf\x90\x18\x60\x95\xef\xbf"
 	"\x55\x32\x0d\x4b\x6b\x5e\xee\xa3\x39\xda";
 
-const uint8_t sha256_null_hash[] +static const uint8_t sha256_null_hash[]  	"\x55\xb8\x52\x78\x1b\x99\x95\xa4"
 	"\x4c\x93\x9b\x64\xe4\x41\xae\x27"
 	"\x24\xb9\x6f\x99\xc8\xf4\xfb\x9a"
