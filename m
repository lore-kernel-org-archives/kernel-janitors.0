From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Oct 2019 13:41:13 +0000
Subject: [PATCH] iwlegacy: make array interval static, makes object smaller
Message-Id: <20191007134113.5647-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislaw Gruszka <sgruszka@redhat.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array interval on the stack but instead make it
static. Makes the object code smaller by 121 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
 167797	  29676	    448	 197921	  30521	wireless/intel/iwlegacy/common.o

After:
   text	   data	    bss	    dec	    hex	filename
 167580	  29772	    448	 197800	  304a8	wireless/intel/iwlegacy/common.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/iwlegacy/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlegacy/common.c b/drivers/net/wireless/intel/iwlegacy/common.c
index 73f7bbf742bc..e4ea734e58d8 100644
--- a/drivers/net/wireless/intel/iwlegacy/common.c
+++ b/drivers/net/wireless/intel/iwlegacy/common.c
@@ -1072,7 +1072,7 @@ EXPORT_SYMBOL(il_get_channel_info);
 static void
 il_build_powertable_cmd(struct il_priv *il, struct il_powertable_cmd *cmd)
 {
-	const __le32 interval[3][IL_POWER_VEC_SIZE] = {
+	static const __le32 interval[3][IL_POWER_VEC_SIZE] = {
 		SLP_VEC(2, 2, 4, 6, 0xFF),
 		SLP_VEC(2, 4, 7, 10, 10),
 		SLP_VEC(4, 7, 10, 10, 0xFF)
-- 
2.20.1
