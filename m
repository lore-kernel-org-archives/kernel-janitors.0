From: Cyrill Gorcunov <gorcunov@openvz.org>
Date: Wed, 26 Sep 2012 17:08:40 +0000
Subject: Re: [next:akpm 26/413] kernel/sys.c:1868:14: sparse: incorrect type in argument 1 (different base ty
Message-Id: <20120926170840.GC20086@moon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926155910.GA14447@localhost>
In-Reply-To: <20120926155910.GA14447@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 26, 2012 at 11:59:10PM +0800, Fengguang Wu wrote:
> Hi Cyrill,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   dad0019944369f58c193c1991c39ffda7ff584d2
> commit: c9eeef146c554f8ddcdf5916fb93621f0579e2f8 [26/413] prctl: use access_ok() instead of TASK_SIZE in prctl_set_mm()
> 
>   kernel/sys.c:1048:38: sparse: incorrect type in argument 2 (different modifiers)

Thanks Fengguang!

This patch should calm the warning down (I wonder why gcc has not
spot anything, otoh on asm level it's plain long as far as i can
tell).
---
From: Cyrill Gorcunov <gorcunov@openvz.org>
Subject: prctl: prctl_set_mm - Cast type of @addr

The sparse tool warns about type casting

 >   kernel/sys.c:1048:38: sparse: incorrect type in argument 2 (different modifiers)

Fix it with explicit type convention.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Cyrill Gorcunov <gorcunov@openvz.org>
---
 kernel/sys.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6.git/kernel/sys.c
=================================--- linux-2.6.git.orig/kernel/sys.c
+++ linux-2.6.git/kernel/sys.c
@@ -1865,7 +1865,7 @@ static int prctl_set_mm(int opt, unsigne
 	if (opt = PR_SET_MM_EXE_FILE)
 		return prctl_set_mm_exe_file(mm, (unsigned int)addr);
 
-	if (!access_ok(VERIFY_READ, addr, sizeof(addr)) || addr < mmap_min_addr)
+	if (!access_ok(VERIFY_READ, (void *)addr, sizeof(addr)) || addr < mmap_min_addr)
 		return -EINVAL;
 
 	error = -EINVAL;
