From: Colin King <colin.king@canonical.com>
Date: Sun, 07 Jan 2018 23:45:08 +0000
Subject: [PATCH] be2net: use ARRAY_SIZE for array sizing calculation on array cmd_priv_map
Message-Id: <20180107234508.8221-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Perla <sathya.perla@broadcom.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use the ARRAY_SIZE macro on array cmd_priv_map to determine size of the
array.  Improvement suggested by coccinelle.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/emulex/benet/be_cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/emulex/benet/be_cmds.c b/drivers/net/ethernet/emulex/benet/be_cmds.c
index 02dd5246dfae..1a49297224ed 100644
--- a/drivers/net/ethernet/emulex/benet/be_cmds.c
+++ b/drivers/net/ethernet/emulex/benet/be_cmds.c
@@ -103,7 +103,7 @@ static struct be_cmd_priv_map cmd_priv_map[] = {
 static bool be_cmd_allowed(struct be_adapter *adapter, u8 opcode, u8 subsystem)
 {
 	int i;
-	int num_entries = sizeof(cmd_priv_map)/sizeof(struct be_cmd_priv_map);
+	int num_entries = ARRAY_SIZE(cmd_priv_map);
 	u32 cmd_privileges = adapter->cmd_privileges;
 
 	for (i = 0; i < num_entries; i++)
-- 
2.15.1

