From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 13 Nov 2020 08:12:48 +0000
Subject: [PATCH] dmaengine: ioatdma: remove unused function missed during dma_v2 removal
Message-Id: <20201113081248.26416-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maciej Sosnowski <maciej.sosnowski@intel.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org
Cc: Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 7f832645d0e5 ("dmaengine: ioatdma: remove ioatdma v2 registration")
missed to remove dca2_tag_map_valid() during its removal. Hence, since
then, dca2_tag_map_valid() is unused and make CC=clang W=1 warns:

  drivers/dma/ioat/dca.c:44:19:
    warning: unused function 'dca2_tag_map_valid' [-Wunused-function]

So, remove this unused function and get rid of a -Wused-function warning.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201112

Maciej, please ack.

Vinod, Dan, please pick this minor non-urgent clean-up patch.

 drivers/dma/ioat/dca.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/dma/ioat/dca.c b/drivers/dma/ioat/dca.c
index 0be385587c4c..289c59ed74b9 100644
--- a/drivers/dma/ioat/dca.c
+++ b/drivers/dma/ioat/dca.c
@@ -40,16 +40,6 @@
 #define DCA2_TAG_MAP_BYTE3 0x82
 #define DCA2_TAG_MAP_BYTE4 0x82
 
-/* verify if tag map matches expected values */
-static inline int dca2_tag_map_valid(u8 *tag_map)
-{
-	return ((tag_map[0] = DCA2_TAG_MAP_BYTE0) &&
-		(tag_map[1] = DCA2_TAG_MAP_BYTE1) &&
-		(tag_map[2] = DCA2_TAG_MAP_BYTE2) &&
-		(tag_map[3] = DCA2_TAG_MAP_BYTE3) &&
-		(tag_map[4] = DCA2_TAG_MAP_BYTE4));
-}
-
 /*
  * "Legacy" DCA systems do not implement the DCA register set in the
  * I/OAT device.  Software needs direct support for their tag mappings.
-- 
2.17.1
