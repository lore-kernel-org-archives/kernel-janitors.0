From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 02 Oct 2013 12:19:48 +0000
Subject: [PATCH 08/19 v2] net: atl1c: Change variable type to bool
Message-Id: <1380716391-20214-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jcliburn@gmail.com
Cc: chris.snook@gmail.com, jkosina@suse.cz, rdunlap@infradead.org, standby24x7@gmail.com, peter.senna@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The variable ret is only assigned the values true and false.
The function atl1c_read_eeprom already returns bool. Change
ret type to bool.

The simplified semantic patch that find this problem is as
follows (http://coccinelle.lip6.fr/):

@exists@
type T;
identifier b;
@@
- T
+ bool
  b = ...;
  ... when any
  b = \(true\|false\)

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
Changes from v1:
 - Added subsystem prefix to shortlog

 drivers/net/ethernet/atheros/atl1c/atl1c_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_hw.c b/drivers/net/ethernet/atheros/atl1c/atl1c_hw.c
index 3ef7092..1cda49a 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_hw.c
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_hw.c
@@ -153,7 +153,7 @@ static int atl1c_get_permanent_address(struct atl1c_hw *hw)
 bool atl1c_read_eeprom(struct atl1c_hw *hw, u32 offset, u32 *p_value)
 {
 	int i;
-	int ret = false;
+	bool ret = false;
 	u32 otp_ctrl_data;
 	u32 control;
 	u32 data;
-- 
1.8.3.1

