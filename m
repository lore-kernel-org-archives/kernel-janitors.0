From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 05 Sep 2018 11:44:10 +0000
Subject: [PATCH net-next] bnxt_en: remove set but not used variable 'addr_type'
Message-Id: <1536147850-186781-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535688481-65721-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535688481-65721-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Chan <michael.chan@broadcom.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c: In function 'bnxt_tc_parse_flow':
drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:186:6: warning:
 variable 'addr_type' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c
index 092c817..f4ba9b3 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c
@@ -181,7 +181,6 @@ static int bnxt_tc_parse_flow(struct bnxt *bp,
 			      struct bnxt_tc_flow *flow)
 {
 	struct flow_dissector *dissector = tc_flow_cmd->dissector;
-	u16 addr_type = 0;
 
 	/* KEY_CONTROL and KEY_BASIC are needed for forming a meaningful key */
 	if ((dissector->used_keys & BIT(FLOW_DISSECTOR_KEY_CONTROL)) = 0 ||
@@ -191,13 +190,6 @@ static int bnxt_tc_parse_flow(struct bnxt *bp,
 		return -EOPNOTSUPP;
 	}
 
-	if (dissector_uses_key(dissector, FLOW_DISSECTOR_KEY_CONTROL)) {
-		struct flow_dissector_key_control *key -			GET_KEY(tc_flow_cmd, FLOW_DISSECTOR_KEY_CONTROL);
-
-		addr_type = key->addr_type;
-	}
-
 	if (dissector_uses_key(dissector, FLOW_DISSECTOR_KEY_BASIC)) {
 		struct flow_dissector_key_basic *key  			GET_KEY(tc_flow_cmd, FLOW_DISSECTOR_KEY_BASIC);
@@ -293,13 +285,6 @@ static int bnxt_tc_parse_flow(struct bnxt *bp,
 		flow->l4_mask.icmp.code = mask->code;
 	}
 
-	if (dissector_uses_key(dissector, FLOW_DISSECTOR_KEY_ENC_CONTROL)) {
-		struct flow_dissector_key_control *key -			GET_KEY(tc_flow_cmd, FLOW_DISSECTOR_KEY_ENC_CONTROL);
-
-		addr_type = key->addr_type;
-	}
-
 	if (dissector_uses_key(dissector, FLOW_DISSECTOR_KEY_ENC_IPV4_ADDRS)) {
 		struct flow_dissector_key_ipv4_addrs *key  			GET_KEY(tc_flow_cmd, FLOW_DISSECTOR_KEY_ENC_IPV4_ADDRS);
