From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 May 2020 12:04:14 +0000
Subject: [PATCH v2] of: Fix a refcounting bug in __of_attach_node_sysfs()
Message-Id: <20200520120414.GE172354@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <877dx69az4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem in this code is that if kobject_add() fails, then it should
call of_node_put(np) to drop the reference count.  I've actually moved
the of_node_get(np) later in the function to avoid needing to do clean
up.

Fixes: 5b2c2f5a0ea3 ("of: overlay: add missing of_node_get() in __of_attach_node_sysfs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: move the of_node_get() instead of doing clean up.  Also the v1 had a
    confusing typo in the commit message.

 drivers/of/kobj.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index c72eef988041..a32e60b024b8 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -134,8 +134,6 @@ int __of_attach_node_sysfs(struct device_node *np)
 	if (!name)
 		return -ENOMEM;
 
-	of_node_get(np);
-
 	rc = kobject_add(&np->kobj, parent, "%s", name);
 	kfree(name);
 	if (rc)
@@ -144,6 +142,7 @@ int __of_attach_node_sysfs(struct device_node *np)
 	for_each_property_of_node(np, pp)
 		__of_add_property_sysfs(np, pp);
 
+	of_node_get(np);
 	return 0;
 }
 
-- 
2.26.2
