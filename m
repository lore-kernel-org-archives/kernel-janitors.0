From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2015 10:23:01 +0000
Subject: [patch] usb: gadget: f_tcm: memory leak on error in tcm_alloc_inst()
Message-Id: <20151209102301.GC3173@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to kfree(opts) on error.  Also it's nicer to allocate opts
before taking the lock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index ed47e40..0a26a2e 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -2300,20 +2300,19 @@ static struct usb_function_instance *tcm_alloc_inst(void)
 	struct f_tcm_opts *opts;
 	int i;
 
-	mutex_lock(&tpg_instances_lock);
-	opts = kzalloc(sizeof(*opts), GFP_KERNEL);
-	if (!opts) {
-		mutex_unlock(&tpg_instances_lock);
 
+	opts = kzalloc(sizeof(*opts), GFP_KERNEL);
+	if (!opts)
 		return ERR_PTR(-ENOMEM);
-	}
+
+	mutex_lock(&tpg_instances_lock);
 	for (i = 0; i < TPG_INSTANCES; ++i)
 		if (!tpg_instances[i].func_inst)
 			break;
 
 	if (i = TPG_INSTANCES) {
 		mutex_unlock(&tpg_instances_lock);
-
+		kfree(opts);
 		return ERR_PTR(-EBUSY);
 	}
 	tpg_instances[i].func_inst = &opts->func_inst;
