From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 May 2020 11:30:21 +0000
Subject: [PATCH] of: drop a reference on error in __of_attach_node_sysfs()
Message-Id: <20200518113021.GB48709@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We add a new of_node_get() to this function, but we should drop the
reference if kobject_add().

Fixes: 5b2c2f5a0ea3 ("of: overlay: add missing of_node_get() in __of_attach_node_sysfs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Maybe we should just call of_node_get() right
before we return 0?

 drivers/of/kobj.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index c72eef988041..a90dc4b3b060 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -138,8 +138,10 @@ int __of_attach_node_sysfs(struct device_node *np)
 
 	rc = kobject_add(&np->kobj, parent, "%s", name);
 	kfree(name);
-	if (rc)
+	if (rc) {
+		of_node_put(np);
 		return rc;
+	}
 
 	for_each_property_of_node(np, pp)
 		__of_add_property_sysfs(np, pp);
-- 
2.26.2
