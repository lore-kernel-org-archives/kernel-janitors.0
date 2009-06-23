From: Peter Huewe <PeterHuewe@gmx.de>
Date: Tue, 23 Jun 2009 00:41:05 +0000
Subject: Re: [PATCH] infiniband: adding __init/__exit macros to addr.c and cma.c
Message-Id: <200906230241.05699.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200906110200.05883.PeterHuewe@gmx.de>
In-Reply-To: <200906110200.05883.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init and __exit macros to the module_init /
module_exit functions from drivers/infiniband/core/addr.c and cma.c
linux version 2.6.30

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
Acked-by: Sean Hefty <sean.hefty@intel.com>
---
Hi Roland,
here is the patch :) - it's really trivial I know.
I think it's faster to pull it through your tree, jini has a lot to do I
guess.
Thanks, Peter
diff --git a/drivers/infiniband/core/addr.c b/drivers/infiniband/core/addr.c
index ce511d8..5be1bd4 100644
--- a/drivers/infiniband/core/addr.c
+++ b/drivers/infiniband/core/addr.c
@@ -514,7 +514,7 @@ static struct notifier_block nb = {
 	.notifier_call = netevent_callback
 };

-static int addr_init(void)
+static int __init addr_init(void)
 {
 	addr_wq = create_singlethread_workqueue("ib_addr");
 	if (!addr_wq)
@@ -524,7 +524,7 @@ static int addr_init(void)
 	return 0;
 }

-static void addr_cleanup(void)
+static void __exit addr_cleanup(void)
 {
 	unregister_netevent_notifier(&nb);
 	destroy_workqueue(addr_wq);
diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index 851de83..0753178 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -2960,7 +2960,7 @@ static void cma_remove_one(struct ib_device *device)
 	kfree(cma_dev);
 }

-static int cma_init(void)
+static int __init cma_init(void)
 {
 	int ret, low, high, remaining;

@@ -2990,7 +2990,7 @@ err:
 	return ret;
 }

-static void cma_cleanup(void)
+static void __exit cma_cleanup(void)
 {
 	ib_unregister_client(&cma_client);
 	unregister_netdevice_notifier(&cma_nb);
