From: trem <trem@zarb.org>
Date: Wed, 10 Aug 2005 22:29:13 +0000
Subject: [KJ] register_chrdev could be replaced by cdev_init
Message-Id: <42FA9B4D.1020202@zarb.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all

I've investigated about char device, and I discover that "register_chrdev"
is an old way to register char driver. The new way (good one ?) is 
"cdev_init".

"register_chrdev" is still used in 2.6.13-rc6:
 > find . -name "*.c" -exec grep -l register_chrdev {} \; | wc -l
 > 85

I propose to add this change ("register_chrdev" -> "cdev_init") on the
kerneljanitor TODO list.

regards,
trem



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
