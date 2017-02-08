From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Feb 2017 07:20:35 +0000
Subject: [patch] parisc: fix a printk
Message-Id: <20170208072034.GA12756@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-parisc@vger.kernel.org, kernel-janitors@vger.kernel.org

We want to do a pr_cont() here and not a pr_warn().

Fixes: b391667eb45a ("parisc: Report trap type as human readable string")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 1a0b4f63f0e9..c3f8d34a11cf 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -238,8 +238,8 @@ show_signal_msg(struct pt_regs *regs, unsigned long code,
 		vma ? ',':'\n');
 
 	if (vma)
-		pr_warn(KERN_CONT " vm_start = 0x%08lx, vm_end = 0x%08lx\n",
-				vma->vm_start, vma->vm_end);
+		pr_cont(" vm_start = 0x%08lx, vm_end = 0x%08lx\n",
+			vma->vm_start, vma->vm_end);
 
 	show_regs(regs);
 }
