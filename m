From: Jim Nelson <james4765@verizon.net>
Date: Sat, 30 Oct 2004 19:10:09 +0000
Subject: Re: [KJ] [PATCH] floppy: change MODULE_PARM to module_param in
Message-Id: <4183E711.9030708@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============086486069380733221=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041030134246.23710.45693.84191@localhost.localdomain> <4183BF5B.5000303@osdl.org> <200410301303.45161.dtor_core@ameritech.net>
In-Reply-To: <200410301303.45161.dtor_core@ameritech.net>
To: Dmitry Torokhov <dtor_core@ameritech.net>
Cc: linux-kernel@vger.kernel.org, "Randy.Dunlap" <rddunlap@osdl.org>, kernel-janitors@lists.osdl.org

--===============086486069380733221==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Dmitry Torokhov wrote:
> On Saturday 30 October 2004 11:20 am, Randy.Dunlap wrote:
> 
>>james4765@verizon.net wrote:
>>
>>>Replace MODULE_PARM with module_param in drivers/block/floppy.c.  Compile tested.
>>>
>>>Signed-off-by: James Nelson <james4765@gmail.com>
>>>
>>>diff -urN --exclude='*~' linux-2.6.9-original/drivers/block/floppy.c linux-2.6.9/drivers/block/floppy.c
>>>--- linux-2.6.9-original/drivers/block/floppy.c	2004-10-18 17:53:22.000000000 -0400
>>>+++ linux-2.6.9/drivers/block/floppy.c	2004-10-30 09:16:04.856720081 -0400
>>>@@ -180,6 +180,7 @@
>>> #include <linux/devfs_fs_kernel.h>
>>> #include <linux/device.h>
>>> #include <linux/buffer_head.h>	/* for invalidate_buffers() */
>>>+#include <linux/moduleparam.h>
>>> 
>>> /*
>>>  * PS/2 floppies have much slower step rates than regular floppies.
>>>@@ -4623,9 +4624,9 @@
>>> 	wait_for_completion(&device_release);
>>> }
>>> 
>>>-MODULE_PARM(floppy, "s");
>>>-MODULE_PARM(FLOPPY_IRQ, "i");
>>>-MODULE_PARM(FLOPPY_DMA, "i");
>>>+module_param(floppy, charp, 0);
>>>+module_param(FLOPPY_IRQ, int, 0);
>>>+module_param(FLOPPY_DMA, int, 0);
>>> MODULE_AUTHOR("Alain L. Knaff");
>>> MODULE_SUPPORTED_DEVICE("fd");
>>> MODULE_LICENSE("GPL");
>>
>>Please check Andrew's 2.6.10-rc1-mm2 for a large MODULE_PARAM
>>patch, and then convert drivers that are not yet converted...
>>
>>http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.10-rc1/2.6.10-rc1-mm2/broken-out/convert-module_parm-to-module_param-family.patch
>>

Sorry - that was a quickie w/o checking to see if someone else had already done 
it.  See below.

> 
> 
> Actually it would be nice if drivers were converted "intelligently"
> instead of basic find-and-replace - I really find parameter names
> like floppy.floppy= or floppy.floppy_dma= ugly.
> 
Hmm.  I can tak a look at that a little bit later - just got done with a *huge* 
cleanup of floppy.c - just gotta do the diffs and send them.

Jim

--===============086486069380733221==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============086486069380733221==--
