From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 May 2012 12:51:02 +0000
Subject: [patch] edac_mc: check for allocation failure in edac_mc_alloc()
Message-Id: <20120518125102.GA4422@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add a check here for if kzalloc() failed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index f9c75f9..138c545 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -352,6 +352,8 @@ struct mem_ctl_info *edac_mc_alloc(unsigned mc_num,
 		}
 
 		dimm = kzalloc(sizeof(**mci->dimms), GFP_KERNEL);
+		if (!dimm)
+			goto error;
 		mci->dimms[off] = dimm;
 		dimm->mci = mci;
 
