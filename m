From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 26 Sep 2012 20:05:58 +0000
Subject: Re: [next:akpm 26/413] kernel/sys.c:1868:14: sparse: incorrect type in argument 1 (different base ty
Message-Id: <20120926130558.c1620b11.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926155910.GA14447@localhost>
In-Reply-To: <20120926155910.GA14447@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 26 Sep 2012 21:08:40 +0400
Cyrill Gorcunov <gorcunov@openvz.org> wrote:

> Subject: prctl: prctl_set_mm - Cast type of @addr
> 
> The sparse tool warns about type casting
> 
>  >   kernel/sys.c:1048:38: sparse: incorrect type in argument 2 (different modifiers)
> 
> Fix it with explicit type convention.
> 
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Cyrill Gorcunov <gorcunov@openvz.org>
> ---
>  kernel/sys.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux-2.6.git/kernel/sys.c
> =================================> --- linux-2.6.git.orig/kernel/sys.c
> +++ linux-2.6.git/kernel/sys.c
> @@ -1865,7 +1865,7 @@ static int prctl_set_mm(int opt, unsigne
>  	if (opt = PR_SET_MM_EXE_FILE)
>  		return prctl_set_mm_exe_file(mm, (unsigned int)addr);
>  
> -	if (!access_ok(VERIFY_READ, addr, sizeof(addr)) || addr < mmap_min_addr)
> +	if (!access_ok(VERIFY_READ, (void *)addr, sizeof(addr)) || addr < mmap_min_addr)
>  		return -EINVAL;
>  
>  	error = -EINVAL;

It should have the __user tag as well, methinks?

--- a/kernel/sys.c~prctl-use-access_ok-instead-of-task_size-in-prctl_set_mm-fix-fix
+++ a/kernel/sys.c
@@ -1865,7 +1865,8 @@ static int prctl_set_mm(int opt, unsigne
 	if (opt = PR_SET_MM_EXE_FILE)
 		return prctl_set_mm_exe_file(mm, (unsigned int)addr);
 
-	if (!access_ok(VERIFY_READ, (void *)addr, sizeof(addr)) || addr < mmap_min_addr)
+	if (!access_ok(VERIFY_READ, (void __user *)addr, sizeof(addr)) ||
+			addr < mmap_min_addr)
 		return -EINVAL;
 
 	error = -EINVAL;
_

