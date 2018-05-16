From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 May 2018 08:49:01 +0000
Subject: [PATCH] PM / OPP: silence an uninitialized variable warning
Message-Id: <20180516084900.GC23043@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains that "rate" can be uninitialized here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 7026e9f484ea..afc844806db0 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -317,7 +317,8 @@ static int _opp_add_static_v2(struct opp_table *opp_table, struct device *dev,
 
 	/* Check if the OPP supports hardware's hierarchy of versions or not */
 	if (!_opp_is_supported(dev, opp_table, np)) {
-		dev_dbg(dev, "OPP not supported by hardware: %llu\n", rate);
+		dev_dbg(dev, "OPP not supported by hardware: %lu\n",
+			new_opp->rate);
 		goto free_opp;
 	}
 
