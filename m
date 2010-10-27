From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Oct 2010 14:50:31 +0000
Subject: [patch v2] configfs: documentation: remove unneeded check
Message-Id: <20101027145031.GG6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101027100735.GE6062@bicker> <20101027112207.GA17439@mail.oracle.com>
In-Reply-To: <20101027112207.GA17439@mail.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <Joel.Becker@oracle.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

If "p" is NULL then it will cause an oops when we pass it to
simple_strtoul().  In this case "p" can not be NULL so I removed the
check.  I also changed the check a little to make it more explicit that
we are testing whether p points to the NUL char.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
V2: Added some parenthesis to make the precedence more clear.

diff --git a/Documentation/filesystems/configfs/configfs_example_explicit.c b/Documentation/filesystems/configfs/configfs_example_explicit.c
index d428cc9..63ff248 100644
--- a/Documentation/filesystems/configfs/configfs_example_explicit.c
+++ b/Documentation/filesystems/configfs/configfs_example_explicit.c
@@ -89,7 +89,7 @@ static ssize_t childless_storeme_write(struct childless *childless,
 	char *p = (char *) page;
 
 	tmp = simple_strtoul(p, &p, 10);
-	if (!p || (*p && (*p != '\n')))
+	if ((*p != '\0') && (*p != '\n'))
 		return -EINVAL;
 
 	if (tmp > INT_MAX)

