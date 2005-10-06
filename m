From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 06 Oct 2005 15:20:16 +0000
Subject: [KJ] [PATCH] Remove select_bits_alloc(), select_bits_free()
Message-Id: <20051006152016.GA21578@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57808395002692259=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57808395002692259==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Both are trivial wrappers.
* Each wrapper is used only in one place.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 fs/select.c |   14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

--- ./fs/select.c
+++ ./fs/select.c
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


--===============57808395002692259==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57808395002692259==--
