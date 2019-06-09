From: Mao Wenan <maowenan@huawei.com>
Date: Sun, 09 Jun 2019 07:11:26 +0000
Subject: [PATCH -next] ocelot: remove unused variable 'rc' in vcap_cmd()
Message-Id: <20190609071126.183505-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: davem@davemloft.net
Cc: alexandre.belloni@bootlin.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/mscc/ocelot_ace.c: In function ‘vcap_cmd’:
drivers/net/ethernet/mscc/ocelot_ace.c:108:6: warning: variable ‘rc’ set
but not used [-Wunused-but-set-variable]
  int rc;
      ^
It's never used since introduction in commit b596229448dd ("net: mscc:
ocelot: Add support for tcam")

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/net/ethernet/mscc/ocelot_ace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot_ace.c b/drivers/net/ethernet/mscc/ocelot_ace.c
index f74b98f7d8d1..39aca1ab4687 100644
--- a/drivers/net/ethernet/mscc/ocelot_ace.c
+++ b/drivers/net/ethernet/mscc/ocelot_ace.c
@@ -105,7 +105,6 @@ static void vcap_cmd(struct ocelot *oc, u16 ix, int cmd, int sel)
 	u32 value = (S2_CORE_UPDATE_CTRL_UPDATE_CMD(cmd) |
 		     S2_CORE_UPDATE_CTRL_UPDATE_ADDR(ix) |
 		     S2_CORE_UPDATE_CTRL_UPDATE_SHOT);
-	int rc;
 
 	if ((sel & VCAP_SEL_ENTRY) && ix >= vcap_is2.entry_count)
 		return;
@@ -120,7 +119,7 @@ static void vcap_cmd(struct ocelot *oc, u16 ix, int cmd, int sel)
 		value |= S2_CORE_UPDATE_CTRL_UPDATE_CNT_DIS;
 
 	ocelot_write(oc, value, S2_CORE_UPDATE_CTRL);
-	rc = readx_poll_timeout(vcap_s2_read_update_ctrl, oc, value,
+	readx_poll_timeout(vcap_s2_read_update_ctrl, oc, value,
 				(value & S2_CORE_UPDATE_CTRL_UPDATE_SHOT) = 0,
 				10, 100000);
 }
-- 
2.20.1
