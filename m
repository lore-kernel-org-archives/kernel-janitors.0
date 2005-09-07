From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 07 Sep 2005 14:06:15 +0000
Subject: [KJ] [patch] earlyuserspace/README: fix homonym err
Message-Id: <431EF3D7.2070107@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070908020207090007060607"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070908020207090007060607
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

fix homonym/grammatical error

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>


--------------070908020207090007060607
Content-Type: text/plain;
 name="early-userspace-readme.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="early-userspace-readme.patch"

--- lnew/Documentation/early-userspace/README~	2005-06-19 17:36:45.000000000 -0600
+++ lnew/Documentation/early-userspace/README	2005-06-19 17:41:00.000000000 -0600
@@ -28,7 +28,7 @@
 CPIO ARCHIVE method
 
 You can create a cpio archive that contains the early userspace image.
-Youre cpio archive should be specified in CONFIG_INITRAMFS_SOURCE and it
+Your cpio archive should be specified in CONFIG_INITRAMFS_SOURCE and it
 will be used directly.  Only a single cpio file may be specified in
 CONFIG_INITRAMFS_SOURCE and directory and file names are not allowed in
 combination with a cpio archive.

--------------070908020207090007060607
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070908020207090007060607--
