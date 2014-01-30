From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 12:15:18 +0000
Subject: [patch 1/2]  mmc: omap_hsmmc: remove a duplicative test
Message-Id: <20140130121518.GA10368@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balaji T K <balajitk@ti.com>
Cc: Chris Ball <chris@printf.net>, linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that testing for both "next" and "!next" is
duplicative.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index 2a629fbde613..bfb0dbd052c0 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -1235,8 +1235,7 @@ static int omap_hsmmc_pre_dma_transfer(struct omap_hsmmc_host *host,
 	}
 
 	/* Check if next job is already prepared */
-	if (next ||
-	    (!next && data->host_cookie != host->next_data.cookie)) {
+	if (next || data->host_cookie != host->next_data.cookie) {
 		dma_len = dma_map_sg(chan->device->dev, data->sg, data->sg_len,
 				     omap_hsmmc_get_dma_dir(host, data));
 
