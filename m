From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 11:19:43 +0000
Subject: [PATCH] be2net: make two arrays static const, makes object smaller
Message-Id: <20190906111943.5285-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Perla <sathya.perla@broadcom.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the arrays on the stack but instead make them
static const. Makes the object code smaller by 281 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  87553	   5672	      0	  93225	  16c29	benet/be_cmds.o

After:
   text	   data	    bss	    dec	    hex	filename
  87112	   5832	      0	  92944	  16b10	benet/be_cmds.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/emulex/benet/be_cmds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/emulex/benet/be_cmds.c b/drivers/net/ethernet/emulex/benet/be_cmds.c
index 323976c811e9..701c12c9e033 100644
--- a/drivers/net/ethernet/emulex/benet/be_cmds.c
+++ b/drivers/net/ethernet/emulex/benet/be_cmds.c
@@ -2756,7 +2756,7 @@ static int be_flash_BEx(struct be_adapter *adapter,
 	bool crc_match;
 	const u8 *p;
 
-	struct flash_comp gen3_flash_types[] = {
+	static const struct flash_comp gen3_flash_types[] = {
 		{ BE3_ISCSI_PRIMARY_IMAGE_START, OPTYPE_ISCSI_ACTIVE,
 			BE3_COMP_MAX_SIZE, IMAGE_FIRMWARE_ISCSI},
 		{ BE3_REDBOOT_START, OPTYPE_REDBOOT,
@@ -2779,7 +2779,7 @@ static int be_flash_BEx(struct be_adapter *adapter,
 			BE3_PHY_FW_COMP_MAX_SIZE, IMAGE_FIRMWARE_PHY}
 	};
 
-	struct flash_comp gen2_flash_types[] = {
+	static const struct flash_comp gen2_flash_types[] = {
 		{ BE2_ISCSI_PRIMARY_IMAGE_START, OPTYPE_ISCSI_ACTIVE,
 			BE2_COMP_MAX_SIZE, IMAGE_FIRMWARE_ISCSI},
 		{ BE2_REDBOOT_START, OPTYPE_REDBOOT,
-- 
2.20.1
