From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Thu, 19 Jan 2006 20:18:30 +0000
Subject: [KJ] [PATCH 5/5] README: Updates to LILO related text
Message-Id: <a01a16b50601191218k723bd0cei148c4bcd6d8297e2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

From: H=E5kon L=F8vdal <Hakon.Lovdal@ericsson.com>

Use LILO everywhere instead of both lilo and LILO.

Mention GRUB as a possible boot loader in addition to LILO.

Rewritten a sentence that was written as an alternative to a paragraph
about booting directly from floppy (no longer present and no longer
supported).

Replace the phrase "reinstalling LILO" with "reinstalling the LILO
boot loader code"
to be more specific (as opposed to re-installing an rpm or deb LILO package=
).

Signed-off-by: H=E5kon L=F8vdal <Hakon.Lovdal@ericsson.com>

---

--- linux-2.6.15.1/README.XX,x,x.y	2006-01-19 14:32:40.000000000 +0100
+++ linux-2.6.15.1/README	2006-01-19 14:36:35.000000000 +0100
@@ -192,8 +192,8 @@
    if necessary. For more information, refer to Documentation/Changes.

  - Do a "make" to create a compressed kernel image. It is also
-   possible to do "make install" if you have lilo installed to suit the
-   kernel makefiles, but you may want to check your particular lilo
setup first.
+   possible to do "make install" if you have LILO installed to suit the
+   kernel makefiles, but you may want to check your particular LILO
setup first.

    To do the actual install you have to be root, but none of the normal
    build should require that. Don't take the name of root in vain.
@@ -215,23 +215,23 @@
    to the place where your regular bootable kernel is found.

  - Booting a kernel directly from a floppy without the assistance of a
-   bootloader such as LILO, is no longer supported.
+   bootloader such as LILO or GRUB, is no longer supported.

-   If you boot Linux from the hard drive, chances are you use LILO which
-   uses the kernel image as specified in the file /etc/lilo.conf.  The
-   kernel image file is usually /vmlinuz, /boot/vmlinuz, /bzImage or
+   If you boot Linux using LILO, notice that LILO uses the kernel image
+   as specified in the file /etc/lilo.conf.
+   The kernel image file is usually /vmlinuz, /boot/vmlinuz, /bzImage or
    /boot/bzImage.  To use the new kernel, save a copy of the old image
    and copy the new image over the old one.  Then, you MUST RERUN LILO
    to update the loading map!! If you don't, you won't be able to boot
    the new kernel image.

-   Reinstalling LILO is usually a matter of running /sbin/lilo.
+   Reinstalling the LILO boot loader code is usually a matter of
running /sbin/lilo.
    You may wish to edit /etc/lilo.conf to specify an entry for your
    old kernel image (say, /vmlinux.old) in case the new one does not
    work.  See the LILO docs for more information.

-   After reinstalling LILO, you should be all set.  Shutdown the system,
-   reboot, and enjoy!
+   After reinstalling the LILO boot loader code, you should be all set.
+   Shutdown the system, reboot, and enjoy!

    If you ever need to change the default root device, video mode,
    ramdisk size, etc.  in the kernel image, use the 'rdev' program (or

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
