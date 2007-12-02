From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 02 Dec 2007 17:37:21 +0000
Subject: "unpack_to_rootfs()" -- augment or replace the current root fs?
Message-Id: <alpine.LFD.0.9999.0712021235470.24023@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  (apologies for posting this to the kj list rather than the newbies
list, but the newbies list seems to be deader than dick cheney's heart
right now.)


  in the source file init/initramfs.c, near the bottom, the beginning
of populating the root filesystem:

...
static int __init populate_rootfs(void)
{
        char *err = unpack_to_rootfs(__initramfs_start,
                         __initramfs_end - __initramfs_start, 0);
        if (err)
                panic(err);
#ifdef CONFIG_BLK_DEV_INITRD
        if (initrd_start) {
#ifdef CONFIG_BLK_DEV_RAM
                int fd;
                printk(KERN_INFO "checking if image is initramfs...");
                err = unpack_to_rootfs((char *)initrd_start,
                        initrd_end - initrd_start, 1);
...

  now, i'm still working my way thru the unpack_to_rootfs() routine
but, given that the code above first unpacks the in-kernel cpio-format
initramfs, if there *is* an external initrd (either cpio or ext2
format, perhaps), would that second unpacking *replace* the current
unpacked rootfs, or would it simply *augment* its contents?

  yes, i realize i could figure it out from RTFS, but TFS is a bit
convoluted to say the least.

rday

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
