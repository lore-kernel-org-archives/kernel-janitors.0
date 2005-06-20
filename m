From: Jim Cromie <jcromie@divsol.com>
Date: Mon, 20 Jun 2005 00:33:57 +0000
Subject: [KJ] [patch] early-userspace/README spelling err
Message-Id: <42B60EF5.8080503@divsol.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040504090903050103020103"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040504090903050103020103
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


s/Youre/Your/

$ diffstat early-userspace-readme.patch
 README |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Signed-off-by:  Jim Cromie <jcromie@divsol.com>

--------------040504090903050103020103
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

--------------040504090903050103020103
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040504090903050103020103--
