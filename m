From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 08 Oct 2005 23:26:36 +0000
Subject: [KJ] [PATCH] Remove select_bits_alloc(), select_bits_free()
Message-Id: <20051008232636.GG24907@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14421267315502928=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051006152016.GA21578@mipter.zuzino.mipt.ru>
In-Reply-To: <20051006152016.GA21578@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============14421267315502928==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Both are trivial wrappers.
* Each wrapper is used only in one place.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 fs/compat.c |   13 ++-----------
 fs/select.c |   14 ++------------
 2 files changed, 4 insertions(+), 23 deletions(-)

Index: linux-kj/fs/select.c
===================================================================
--- linux-kj.orig/fs/select.c	2005-10-07 17:52:20.000000000 +0400
+++ linux-kj/fs/select.c	2005-10-09 03:14:45.000000000 +0400
@@ -274,16 +274,6 @@ int do_select(int n, fd_set_bits *fds, l
 	return retval;
 }
 
-static void *select_bits_alloc(int size)
-{
-	return kmalloc(6 * size, GFP_KERNEL);
-}
-
-static void select_bits_free(void *bits, int size)
-{
-	kfree(bits);
-}
-
 /*
  * We can actually return ERESTARTSYS instead of EINTR, but I'd
  * like to be certain this leads to no problems. So I return
@@ -344,7 +334,7 @@ sys_select(int n, fd_set __user *inp, fd
 	 */
 	ret = -ENOMEM;
 	size = FDS_BYTES(n);
-	bits = select_bits_alloc(size);
+	bits = kmalloc(6 * size, GFP_KERNEL);
 	if (!bits)
 		goto out_nofds;
 	fds.in      = (unsigned long *)  bits;
@@ -390,7 +380,7 @@ sys_select(int n, fd_set __user *inp, fd
 		ret = -EFAULT;
 
 out:
-	select_bits_free(bits, size);
+	kfree(bits);
 out_nofds:
 	return ret;
 }
Index: linux-kj/fs/compat.c
===================================================================
--- linux-kj.orig/fs/compat.c	2005-10-07 17:52:20.000000000 +0400
+++ linux-kj/fs/compat.c	2005-10-09 03:18:02.000000000 +0400
@@ -1594,15 +1594,6 @@ void compat_set_fd_set(unsigned long nr,
  * This is a virtual copy of sys_select from fs/select.c and probably
  * should be compared to it from time to time
  */
-static void *select_bits_alloc(int size)
-{
-	return kmalloc(6 * size, GFP_KERNEL);
-}
-
-static void select_bits_free(void *bits, int size)
-{
-	kfree(bits);
-}
 
 /*
  * We can actually return ERESTARTSYS instead of EINTR, but I'd
@@ -1663,7 +1654,7 @@ compat_sys_select(int n, compat_ulong_t 
 	 */
 	ret = -ENOMEM;
 	size = FDS_BYTES(n);
-	bits = select_bits_alloc(size);
+	bits = kmalloc(6 * size, GFP_KERNEL);
 	if (!bits)
 		goto out_nofds;
 	fds.in      = (unsigned long *)  bits;
@@ -1709,7 +1700,7 @@ compat_sys_select(int n, compat_ulong_t 
 	compat_set_fd_set(n, exp, fds.res_ex);
 
 out:
-	select_bits_free(bits, size);
+	kfree(bits);
 out_nofds:
 	return ret;
 }


--===============14421267315502928==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14421267315502928==--
