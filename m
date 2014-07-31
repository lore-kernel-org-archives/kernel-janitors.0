From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Jul 2014 15:20:20 +0000
Subject: [patch] [PARISC] sys_hpux: NUL terminator is one past the end
Message-Id: <20140731152020.GB31539@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, kernel-janitors@vger.kernel.org

We allocate "len" number of chars so we should put the NUL at "len - 1"
to avoid corrupting memory.  Btw, strlen_user() is different from the
normal strlen() function because it includes NUL terminator in the
count.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/parisc/hpux/sys_hpux.c b/arch/parisc/hpux/sys_hpux.c
index d9dc6cd..e5c4da0 100644
--- a/arch/parisc/hpux/sys_hpux.c
+++ b/arch/parisc/hpux/sys_hpux.c
@@ -456,7 +456,7 @@ int hpux_sysfs(int opcode, unsigned long arg1, unsigned long arg2)
 		}
 
 		/* String could be altered by userspace after strlen_user() */
-		fsname[len] = '\0';
+		fsname[len - 1] = '\0';
 
 		printk(KERN_DEBUG "that is '%s' as (char *)\n", fsname);
 		if ( !strcmp(fsname, "hfs") ) {
