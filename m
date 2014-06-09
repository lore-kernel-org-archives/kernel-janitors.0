From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:12:12 +0000
Subject: [patch] VME: remove duplicate CA91CX42_DCTL_VDW_M define
Message-Id: <20140609151212.GG9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The CA91CX42_DCTL_VDW_M define is cut and pasted twice so we can delete
the second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vme/bridges/vme_ca91cx42.h b/drivers/vme/bridges/vme_ca91cx42.h
index 02a7c79..d46b12d 100644
--- a/drivers/vme/bridges/vme_ca91cx42.h
+++ b/drivers/vme/bridges/vme_ca91cx42.h
@@ -360,7 +360,6 @@ static const int CA91CX42_VSI_TO[] = { VSI0_TO, VSI1_TO, VSI2_TO, VSI3_TO,
  */
 #define CA91CX42_DCTL_L2V		(1<<31)
 #define CA91CX42_DCTL_VDW_M		(3<<22)
-#define CA91CX42_DCTL_VDW_M		(3<<22)
 #define CA91CX42_DCTL_VDW_D8		0
 #define CA91CX42_DCTL_VDW_D16		(1<<22)
 #define CA91CX42_DCTL_VDW_D32		(1<<23)
