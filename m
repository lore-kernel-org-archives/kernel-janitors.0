From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Sep 2020 08:32:35 +0000
Subject: [PATCH] soundwire: remove an unnecessary NULL check
Message-Id: <20200923083235.GB1454948@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org

The "bus" pointer isn't NULL so the address to a non-zero offset in
middle of "bus" cannot be NULL.  Delete the NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 6088775b67a5..fdc0db71360e 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -342,15 +342,11 @@ static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
 static int sdw_compute_bus_params(struct sdw_bus *bus)
 {
 	unsigned int max_dr_freq, curr_dr_freq = 0;
-	struct sdw_master_prop *mstr_prop = NULL;
+	struct sdw_master_prop *mstr_prop = &bus->prop;
 	int i, clk_values, ret;
 	bool is_gear = false;
 	u32 *clk_buf;
 
-	mstr_prop = &bus->prop;
-	if (!mstr_prop)
-		return -EINVAL;
-
 	if (mstr_prop->num_clk_gears) {
 		clk_values = mstr_prop->num_clk_gears;
 		clk_buf = mstr_prop->clk_gears;
-- 
2.28.0
