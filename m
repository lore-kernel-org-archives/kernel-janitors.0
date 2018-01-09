From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Jan 2018 09:37:44 +0000
Subject: [PATCH 2/2] soundwire: Testing the wrong variable
Message-Id: <20180109093744.egp4vynjgghidp6i@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180109093700.7275ardpus7g6rkq@mwanda>
In-Reply-To: <20180109093700.7275ardpus7g6rkq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org

We should be using "status2" here instead of "status".

Fixes: b0a9c37b0178 ("soundwire: Add slave status handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index ac88031f7664..a5d41a4a1609 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -741,10 +741,10 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 
 		/* Read DPN interrupt again */
 		status2 = sdw_read(slave, addr);
-		if (status < 0) {
+		if (status2 < 0) {
 			dev_err(slave->bus->dev,
-					"SDW_DPN_INT read failed:%d", status);
-			return status;
+					"SDW_DPN_INT read failed:%d", status2);
+			return status2;
 		}
 		status &= status2;
 
