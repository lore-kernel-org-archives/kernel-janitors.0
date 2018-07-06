From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Jul 2018 08:38:25 +0000
Subject: [PATCH] Staging: Gasket: fix a couple off by one bugs
Message-Id: <20180706083824.pxpi43mtgs2nraa4@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The > should be >= or we end up writing one element beyond the end of
the interrupt_data->eventfd_ctxs[] array.

Fixes: 9a69f5087ccc ("drivers/staging: Gasket driver framework + Apex driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gasket/gasket_interrupt.c b/drivers/staging/gasket/gasket_interrupt.c
index b74eefe41d72..850bbed98272 100644
--- a/drivers/staging/gasket/gasket_interrupt.c
+++ b/drivers/staging/gasket/gasket_interrupt.c
@@ -511,7 +511,7 @@ int gasket_interrupt_set_eventfd(
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 
-	if (interrupt < 0 || interrupt > interrupt_data->num_interrupts)
+	if (interrupt < 0 || interrupt >= interrupt_data->num_interrupts)
 		return -EINVAL;
 
 	interrupt_data->eventfd_ctxs[interrupt] = ctx;
@@ -521,7 +521,7 @@ int gasket_interrupt_set_eventfd(
 int gasket_interrupt_clear_eventfd(
 	struct gasket_interrupt_data *interrupt_data, int interrupt)
 {
-	if (interrupt < 0 || interrupt > interrupt_data->num_interrupts)
+	if (interrupt < 0 || interrupt >= interrupt_data->num_interrupts)
 		return -EINVAL;
 
 	interrupt_data->eventfd_ctxs[interrupt] = NULL;
