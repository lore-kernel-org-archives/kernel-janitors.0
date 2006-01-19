From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Thu, 19 Jan 2006 20:16:39 +0000
Subject: [KJ] [PATCH 4/5] README: name kernel versions either "2.6.x",
Message-Id: <a01a16b50601191216v70796a40w25825996a60893e9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

From: H=E5kon L=F8vdal <Hakon.Lovdal@ericsson.com>

Added a little consistency to kernel version strings by using only
either "2.6.x", "2.6.x.y" or "2.6.XX" (where XX means either x or x.y).
Removed a reference to the development branch.

Signed-off-by: H=E5kon L=F8vdal <Hakon.Lovdal@ericsson.com>

---

--- linux-2.6.15.1/README.bzip2	2006-01-19 14:21:32.000000000 +0100
+++ linux-2.6.15.1/README	2006-01-19 14:28:20.000000000 +0100
@@ -1,4 +1,4 @@
-	Linux kernel release 2.6.xx
+	Linux kernel release 2.6.XX

 These are the release notes for Linux version 2.6.  Read them carefully,
 as they tell you what this is all about, explain how to install the
@@ -59,23 +59,25 @@


    Replace "XX" with the version number of the latest kernel.
+   The 2.6 kernels exists in both 2.6.x and 2.6.x.y variants,
+   "XX" in this file refers to both "x" and "x.y".

    Do NOT use the /usr/src/linux area! This area has a (usually
    incomplete) set of kernel headers that are used by the library header
    files.  They should match the library, and not get messed up by
    whatever the kernel-du-jour happens to be.

- - You can also upgrade between 2.6.xx releases by patching.  Patches are
+ - You can also upgrade between 2.6.XX releases by patching.  Patches are
    distributed in the traditional gzip and the newer bzip2 format.  To
    install by patching, get all the newer patch files, enter the
-   top level directory of the kernel source (linux-2.6.xx) and execute:
+   top level directory of the kernel source (linux-2.6.XX) and execute:

-		gzip -cd ../patch-2.6.xx.gz | patch -p1
+		gzip -cd ../patch-2.6.XX.gz | patch -p1

    or
-		bzip2 -dc ../patch-2.6.xx.bz2 | patch -p1
+		bzip2 -dc ../patch-2.6.XX.bz2 | patch -p1

-   (repeat xx for all versions bigger than the version of your current
+   (repeat XX for all versions bigger than the version of your current
    source tree, _in_order_) and you should be ok.  You may want to remove
    the backup files (xxx~ or xxx.orig), and make sure that there are no
    failed patches (xxx# or xxx.rej). If there are, either you or me has
@@ -97,8 +99,8 @@
    an alternative directory can be specified as the second argument.

  - If you are upgrading between releases using the stable series patches
-   (for example, patch-2.6.xx.y), note that these "dot-releases" are
-   not incremental and must be applied to the 2.6.xx base tree. For
+   (for example, patch-2.6.x.y), note that these "dot-releases" are
+   not incremental and must be applied to the 2.6.x base tree. For
    example, if your base kernel is 2.6.12 and you want to apply the
    2.6.12.3 patch, you do not and indeed must not first apply the
    2.6.12.1 and 2.6.12.2 patches. Similarly, if you are running kernel
@@ -115,7 +117,7 @@

 SOFTWARE REQUIREMENTS

-   Compiling and running the 2.6.xx kernels requires up-to-date
+   Compiling and running the 2.6.XX kernels requires up-to-date
    versions of various software packages.  Consult
    Documentation/Changes for the minimum version numbers required
    and how to get updates for these packages.  Beware that using
@@ -199,9 +201,7 @@
  - If you configured any of the parts of the kernel as `modules', you
    will also have to do "make modules_install".

- - Keep a backup kernel handy in case something goes wrong.  This is
-   especially true for the development releases, since each new release
-   contains new code which has not been debugged.  Make sure you keep a
+ - Keep a backup kernel handy in case something goes wrong. Make sure
you keep a
    backup of the modules corresponding to that kernel, as well.  If you
    are installing a new kernel with the same version number as your
    working kernel, make a backup of your modules directory before you

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
