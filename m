From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jan 2018 12:29:11 +0000
Subject: [PATCH v2] soundwire: Fix a signedness bug
Message-Id: <20180110122911.tsd4h7vc65ormdbx@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180110105425.GY18649@localhost>
In-Reply-To: <20180110105425.GY18649@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org

"ret" is an int and "buf" is a u8.  sdw_read() returns negative error
codes which are truncated to the u8, 0-255 range before being stored as
an int.  It means that "ret" can't be less than zero.

Fixes: b0a9c37b0178 ("soundwire: Add slave status handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: style change

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4c345197eb55..ae698e63bdf6 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -771,7 +771,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
 
 	/* Read Instat 1, Instat 2 and Instat 3 registers */
-	ret = buf = sdw_read(slave, SDW_SCP_INT1);
+	buf = ret = sdw_read(slave, SDW_SCP_INT1);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
 					"SDW_SCP_INT1 read failed:%d", ret);
@@ -870,7 +870,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		 * Read status again to ensure no new interrupts arrived
 		 * while servicing interrupts.
 		 */
-		ret = _buf = sdw_read(slave, SDW_SCP_INT1);
+		_buf = ret = sdw_read(slave, SDW_SCP_INT1);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 					"SDW_SCP_INT1 read failed:%d", ret);
