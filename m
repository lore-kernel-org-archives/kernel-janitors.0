From: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
Date: Mon, 17 Sep 2012 07:58:24 +0000
Subject: Re: [patch v2] gcov: add a kfree() on error to new_node()
Message-Id: <5056D820.1060302@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120914065203.GB11886@elgon.mountain>
In-Reply-To: <20120914065203.GB11886@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On 14.09.2012 08:52, Dan Carpenter wrote:
> We should free "node->loaded_info" on this error path.  We'd never care
> in real life but it makes the static checkers happy.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: some style changes.
>

Signed-off-by: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
Reviewed-by: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>

Thanks for sending this patch.

Andrew, since there is no tree for gcov patches, could you queue this 
for upstream inclusion?


Regards,
   Peter Oberparleiter

---
We should free "node->loaded_info" on this error path.  We'd never care
in real life but it makes the static checkers happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
Reviewed-by: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
---
v2: some style changes.

diff --git a/kernel/gcov/fs.c b/kernel/gcov/fs.c
index 9bd0934..7ba47f7 100644
--- a/kernel/gcov/fs.c
+++ b/kernel/gcov/fs.c
@@ -451,8 +451,7 @@ static struct gcov_node *new_node(struct gcov_node 
*parent,
  		node->dentry = debugfs_create_dir(node->name, parent->dentry);
  	if (!node->dentry) {
  		pr_warning("could not create file\n");
-		kfree(node);
-		return NULL;
+		goto err_info;
  	}
  	if (info)
  		add_links(node, parent->dentry);
@@ -461,6 +460,8 @@ static struct gcov_node *new_node(struct gcov_node 
*parent,

  	return node;

+err_info:
+	kfree(node->loaded_info);
  err_nomem:
  	kfree(node);
  	pr_warning("out of memory\n");

