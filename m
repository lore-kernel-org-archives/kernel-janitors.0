From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 05 Aug 2016 08:56:50 +0000
Subject: [PATCH 10/11] soc: ti: knav_qmss_queue: use of_property_read_bool
Message-Id: <1470387411-15879-11-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Use of_property_read_bool to check for the existence of a property.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2;
statement S2,S1;
@@
-       if (of_get_property(e1,e2,NULL))
+       if (of_property_read_bool(e1,e2))
        S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/soc/ti/knav_qmss_queue.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index b73e353..56b5d7c 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1240,7 +1240,7 @@ static int knav_setup_queue_range(struct knav_device *kdev,
 	if (of_get_property(node, "qalloc-by-id", NULL))
 		range->flags |= RANGE_RESERVED;
 
-	if (of_get_property(node, "accumulator", NULL)) {
+	if (of_property_read_bool(node, "accumulator")) {
 		ret = knav_init_acc_range(kdev, node, range);
 		if (ret < 0) {
 			devm_kfree(dev, range);

