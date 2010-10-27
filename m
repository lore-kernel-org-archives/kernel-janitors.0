From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Oct 2010 10:07:35 +0000
Subject: [patch] configfs: documentation: remove unneeded check
Message-Id: <20101027100735.GE6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@xenotime.net>, joel.becker@oracle.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

If "p" is NULL then it will cause an oops when we pass it to
simple_strtoul().  In this case "p" can not be NULL so I removed the
check and cleaned up the rest of the if condition as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/Documentation/filesystems/configfs/configfs_example_explicit.c b/Documentation/filesystems/configfs/configfs_example_explicit.c
index d428cc9..63ff248 100644
--- a/Documentation/filesystems/configfs/configfs_example_explicit.c
+++ b/Documentation/filesystems/configfs/configfs_example_explicit.c
@@ -89,7 +89,7 @@ static ssize_t childless_storeme_write(struct childless *childless,
 	char *p = (char *) page;
 
 	tmp = simple_strtoul(p, &p, 10);
-	if (!p || (*p && (*p != '\n')))
+	if (*p != '\0' && *p != '\n')
 		return -EINVAL;
 
 	if (tmp > INT_MAX)
