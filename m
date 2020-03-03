From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Mar 2020 10:17:16 +0000
Subject: [PATCH] thunderbolt: Fix error code in tb_port_is_width_supported()
Message-Id: <20200303101716.uf6l62oavfqmf6hm@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

This function is type bool, and it's supposed to return true on success. 
Unfortunately, this path takes negative error codes and casts them to
bool (true) so it's treated as success instead of failure.

Fixes: 91c0c12080d0 ("thunderbolt: Add support for lane bonding")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 7d6ecc342508..a2ce99051c51 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -954,7 +954,7 @@ static bool tb_port_is_width_supported(struct tb_port *port, int width)
 	ret = tb_port_read(port, &phy, TB_CFG_PORT,
 			   port->cap_phy + LANE_ADP_CS_0, 1);
 	if (ret)
-		return ret;
+		return false;
 
 	widths = (phy & LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK) >>
 		LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT;
-- 
2.11.0
