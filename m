From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 07 Apr 2004 23:40:35 +0000
Subject: Re: [Kernel-janitors] [PATCH] clean up  drivers/scsi/pcmcia/nsp_cs
Message-Id: <20040407164035.1efaff4e.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54400435485723198=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <407340C0.7050401@gmx.net>
In-Reply-To: <407340C0.7050401@gmx.net>
To: kernel-janitors@vger.kernel.org

--===============54400435485723198==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 7 Apr 2004 09:49:11 +0200 Daniele Bellucci wrote:

| On Wed, Apr 07, 2004 at 01:44:00AM +0200, Michael Veeck wrote:
| |This patch (against 2.6.5) removes some unnecessary macros from 
| |drivers/scsi/pcmcia/nsp_cs.c and .h
| |
| |One Question: Like MIN/MAX and ARRAY_SIZE, it seems that BIT(x) is also 
| | defined a thousand times in the kernel. But which macro should be 
| |used? Here I included linux/input.h, but I do appreciate feedback on 
| |which version is the safest.

Having one version of BIT() would make some sense.
If there is truly only one version, it should end up in
linux/bitops.h.  If there is one version per arch, then it
should end up in include/asm-*/bitops.h.

Some arch-es use 1ULL to shift, some use 1UL, some use 1.
Only input.h does a modulo operator on the shift count AFAICT.
I would hope that the '%' isn't needed in general.
However, input.h's BIT() is the only one that is non-arch-specific
and potentially used (tested) on all arches.


| .. the problem occours with the dbg/info/warn macros defined in include/linux/usb.h
| 
| there are many other places where macro like that are defined in a different way,
| why don't we store all these usefull macros to a different file?

Like we have in include/linux/device.h ?   E.g.:

#define dev_err(dev, format, arg...)		\
	dev_printk(KERN_ERR , dev , format , ## arg)
#define dev_info(dev, format, arg...)		\
	dev_printk(KERN_INFO , dev , format , ## arg)
#define dev_warn(dev, format, arg...)		\
	dev_printk(KERN_WARNING , dev , format , ## arg)

However, these require a struct device <dev>.

--
~Randy
"We have met the enemy and he is us."  -- Pogo (by Walt Kelly)
(Again.  Sometimes I think ln -s /usr/src/linux/.config .signature)

--===============54400435485723198==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54400435485723198==--
