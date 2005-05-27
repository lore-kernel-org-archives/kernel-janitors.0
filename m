From: Jesse Millan <jessem@cs.pdx.edu>
Date: Fri, 27 May 2005 00:34:32 +0000
Subject: [KJ] [PATCH] Fix misleading gcc4 warning,
Message-Id: <42966B18.6020802@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090602030702090402050404"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090602030702090402050404
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


This warning is a false alarm.

This patch eliminates the warning that addr may be used uninitialized in
the function it87_find. addr is not used uninitialized.





--------------090602030702090402050404
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc5/drivers/i2c/chips/it87.c~	2005-05-26 16:35:24.852065714 -0700
+++ linux-2.6.12-rc5/drivers/i2c/chips/it87.c	2005-05-26 17:20:31.311097793 -0700
@@ -718,6 +718,10 @@ static int it87_find(int *address)
 {
 	int err = -ENODEV;

+	/* Suppress misleading GCC warning:
+	 * 'address' may be used uninitialized in this function. */
+	*address = 0;
+
 	superio_enter();
 	chip_type = superio_inw(DEVID);
 	if (chip_type != IT8712F_DEVID




--------------090602030702090402050404
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090602030702090402050404--
