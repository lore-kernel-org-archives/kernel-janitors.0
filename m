From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 26 Jan 2013 07:49:46 +0000
Subject: [patch] padata: test correct variable in ->store function
Message-Id: <20130126074946.GC14365@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>, Dan Kruchinin <dkruchinin@acm.org>
Cc: linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

It's testing for ->show but calling ->store().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  I don't know if it affects real life.

diff --git a/kernel/padata.c b/kernel/padata.c
index 072f4ee..7ac61c1 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -1013,7 +1013,7 @@ static ssize_t padata_sysfs_store(struct kobject *kobj, struct attribute *attr,
 
 	pinst = kobj2pinst(kobj);
 	pentry = attr2pentry(attr);
-	if (pentry->show)
+	if (pentry->store)
 		ret = pentry->store(pinst, attr, buf, count);
 
 	return ret;
