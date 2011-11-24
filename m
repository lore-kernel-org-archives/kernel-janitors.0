From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 07:22:08 +0000
Subject: [patch] debugfs: remove unneeded cast in debugfs_print_regs32()
Message-Id: <20111124072207.GD14122@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Alessandro Rubini <rubini@gnudd.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The cast here causes a Sparse warning:
fs/debugfs/file.c:561:42: warning: cast removes address space of expression
fs/debugfs/file.c:561:42: warning: incorrect type in argument 1 (different address spaces)
fs/debugfs/file.c:561:42:    expected void const volatile [noderef] <asn:2>*addr
fs/debugfs/file.c:561:42:    got void *<noident>

It's redundant to cast it to a (void *) anyway when it is already a
(void __iomem *).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index e0a3a59..989f07f 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -558,7 +558,7 @@ int debugfs_print_regs32(struct seq_file *s, const struct debugfs_reg32 *regs,
 		if (prefix)
 			ret += seq_printf(s, "%s", prefix);
 		ret += seq_printf(s, "%s = 0x%08x\n", regs->name,
-				  readl((void *)(base + regs->offset)));
+				  readl(base + regs->offset));
 	}
 	return ret;
 }
