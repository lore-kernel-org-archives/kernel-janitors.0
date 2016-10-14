From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Oct 2016 19:18:21 +0000
Subject: [patch] greybus: fix a leak on error in gb_module_create()
Message-Id: <20161014191639.GB21917@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should release ->interfaces[0] as well.

Fixes: b15d97d77017 ("greybus: core: add module abstraction")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/greybus/module.c b/drivers/staging/greybus/module.c
index 69f67dd..660b467 100644
--- a/drivers/staging/greybus/module.c
+++ b/drivers/staging/greybus/module.c
@@ -127,7 +127,7 @@ struct gb_module *gb_module_create(struct gb_host_device *hd, u8 module_id,
 	return module;
 
 err_put_interfaces:
-	for (--i; i > 0; --i)
+	for (--i; i >= 0; --i)
 		gb_interface_put(module->interfaces[i]);
 
 	put_device(&module->dev);
