From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Sep 2012 06:52:03 +0000
Subject: [patch v2] gcov: add a kfree() on error to new_node()
Message-Id: <20120914065203.GB11886@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <5051D4D4.7060906@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should free "node->loaded_info" on this error path.  We'd never care
in real life but it makes the static checkers happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: some style changes.

diff --git a/kernel/gcov/fs.c b/kernel/gcov/fs.c
index 9bd0934..7ba47f7 100644
--- a/kernel/gcov/fs.c
+++ b/kernel/gcov/fs.c
@@ -451,8 +451,7 @@ static struct gcov_node *new_node(struct gcov_node *parent,
 		node->dentry = debugfs_create_dir(node->name, parent->dentry);
 	if (!node->dentry) {
 		pr_warning("could not create file\n");
-		kfree(node);
-		return NULL;
+		goto err_info;
 	}
 	if (info)
 		add_links(node, parent->dentry);
@@ -461,6 +460,8 @@ static struct gcov_node *new_node(struct gcov_node *parent,
 
 	return node;
 
+err_info:
+	kfree(node->loaded_info);
 err_nomem:
 	kfree(node);
 	pr_warning("out of memory\n");
