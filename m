From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Jan 2013 07:46:18 +0000
Subject: [patch] enic: change sprintf() to snprintf()
Message-Id: <20130118074618.GC31793@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Benvenuti <benve@cisco.com>
Cc: Roopa Prabhu <roprabhu@cisco.com>, Neel Patel <neepatel@cisco.com>, Nishank Trivedi <nistrive@cisco.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

These are copying data into 16 char arrays.  They all specify that the
first string can't be more than 11 characters but once you add on the
"-rx-" and the NUL character there isn't space for the %d.

The first string is probably never going to be 11 characters, but if it
is then let's truncate the string instead of corrupting memory.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/cisco/enic/enic_main.c b/drivers/net/ethernet/cisco/enic/enic_main.c
index ebccebf..ec1a233 100644
--- a/drivers/net/ethernet/cisco/enic/enic_main.c
+++ b/drivers/net/ethernet/cisco/enic/enic_main.c
@@ -1490,7 +1490,8 @@ static int enic_request_intr(struct enic *enic)
 
 		for (i = 0; i < enic->rq_count; i++) {
 			intr = enic_msix_rq_intr(enic, i);
-			sprintf(enic->msix[intr].devname,
+			snprintf(enic->msix[intr].devname,
+				sizeof(enic->msix[intr].devname),
 				"%.11s-rx-%d", netdev->name, i);
 			enic->msix[intr].isr = enic_isr_msix_rq;
 			enic->msix[intr].devid = &enic->napi[i];
@@ -1498,20 +1499,23 @@ static int enic_request_intr(struct enic *enic)
 
 		for (i = 0; i < enic->wq_count; i++) {
 			intr = enic_msix_wq_intr(enic, i);
-			sprintf(enic->msix[intr].devname,
+			snprintf(enic->msix[intr].devname,
+				sizeof(enic->msix[intr].devname),
 				"%.11s-tx-%d", netdev->name, i);
 			enic->msix[intr].isr = enic_isr_msix_wq;
 			enic->msix[intr].devid = enic;
 		}
 
 		intr = enic_msix_err_intr(enic);
-		sprintf(enic->msix[intr].devname,
+		snprintf(enic->msix[intr].devname,
+			sizeof(enic->msix[intr].devname),
 			"%.11s-err", netdev->name);
 		enic->msix[intr].isr = enic_isr_msix_err;
 		enic->msix[intr].devid = enic;
 
 		intr = enic_msix_notify_intr(enic);
-		sprintf(enic->msix[intr].devname,
+		snprintf(enic->msix[intr].devname,
+			sizeof(enic->msix[intr].devname),
 			"%.11s-notify", netdev->name);
 		enic->msix[intr].isr = enic_isr_msix_notify;
 		enic->msix[intr].devid = enic;
